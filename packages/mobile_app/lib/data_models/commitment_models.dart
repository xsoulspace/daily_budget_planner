part of 'data_models.dart';

extension type const CommitmentId(String value) {
  factory CommitmentId.fromJson(final String value) => CommitmentId(value);
  factory CommitmentId.create() => CommitmentId(IdCreator.create());
  static const empty = CommitmentId('');
  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;
  String toJson() => value;
}

/// Kind of recurring obligation behind a commitment.
enum CommitmentType {
  subscription,
  creditPayment,
  recurringBill,
  other;

  factory CommitmentType.fromJson(final String json) =>
      CommitmentType.values.byName(json);
  String toJson() => name;
}

/// A recurring financial obligation: subscription, credit payment,
/// recurring bill, etc.
///
/// Commitments are primary inputs of the projection engine (ADR 0002):
/// known amounts on known cadences. They feed today's number and the
/// long-horizon trajectory; individual records only reconcile drift.
@freezed
abstract class Commitment with _$Commitment {
  const factory Commitment({
    @Default(CommitmentId.empty) final CommitmentId id,
    @Default('') final String title,
    @Default(0.0) final double amount,
    @Default(Period.monthly) final Period period,
    @Default(CommitmentType.subscription) final CommitmentType type,
    @Default(CategoryId.empty) final CategoryId categoryId,
    required final DateTime startedAt,
    final DateTime? endedAt,

    /// Optional day of period when the charge occurs (1..31 for monthly).
    @Default(1) final int chargeDayOfMonth,
  }) = _Commitment;
  const Commitment._();

  factory Commitment.fromJson(final Map<String, dynamic> json) =>
      _$CommitmentFromJson(json);
  factory Commitment.create({
    final String title = '',
    final double amount = 0,
    final Period period = Period.monthly,
    final CommitmentType type = CommitmentType.subscription,
    final DateTime? startedAt,
  }) => Commitment(
    id: CommitmentId.create(),
    title: title,
    amount: amount,
    period: period,
    type: type,
    startedAt: startedAt ?? DateTime.now(),
  );

  static final empty = Commitment(startedAt: DateTime.now());

  bool get isExists => id.isNotEmpty;

  /// Whether this commitment charges within [range].
  bool chargesWithin(final DateTimeRange range) {
    if (range.end.isBefore(startedAt)) return false;
    final end = endedAt;
    if (end != null && range.start.isAfter(end)) return false;
    return true;
  }

  /// Number of charge occurrences within [range].
  int occurrencesIn(final DateTimeRange range) {
    if (!chargesWithin(range)) return 0;
    final effectiveEnd = endedAt != null && endedAt!.isBefore(range.end)
        ? endedAt!
        : range.end;
    final effectiveStart = startedAt.isAfter(range.start)
        ? startedAt
        : range.start;
    // Charges follow the cadence anchored at [startedAt]; count the
    // occurrences that land inside [effectiveStart, effectiveEnd].
    var date = startedAt;
    var count = 0;
    while (!date.isAfter(effectiveEnd)) {
      if (!date.isBefore(effectiveStart)) count++;
      date = period == Period.monthly
          ? DateTime(date.year, date.month + 1, date.day)
          : date.add(period.duration);
    }
    return count;
  }

  /// Total amount this commitment charges within [range].
  double totalForRange(final DateTimeRange range) =>
      amount * occurrencesIn(range);
}

extension CommitmentListX on List<Commitment> {
  double totalForRange(final DateTimeRange range) =>
      fold(0, (final sum, final c) => sum + c.totalForRange(range));
}

/// A planned sum for a period bucket: one editable number, not records.
///
/// Planned sums are the second primary input of the projection engine
/// (ADR 0002). Users adjust the remaining sum in one action (Sum→Reason);
/// records only explain drift from this plan.
@freezed
abstract class PlannedSum with _$PlannedSum {
  const factory PlannedSum({
    @Default(BudgetId.empty) final BudgetId id,
    @Default(TransactionType.expense) final TransactionType type,
    @Default(0.0) final double amount,
    required final DateTime periodStart,
    @Default(Period.monthly) final Period period,
  }) = _PlannedSum;
  const PlannedSum._();

  factory PlannedSum.fromJson(final Map<String, dynamic> json) =>
      _$PlannedSumFromJson(json);
  factory PlannedSum.create({
    final TransactionType type = TransactionType.expense,
    final double amount = 0,
    required final DateTime periodStart,
    final Period period = Period.monthly,
  }) => PlannedSum(
    id: BudgetId(IdCreator.create()),
    type: type,
    amount: amount,
    periodStart: periodStart,
    period: period,
  );

  bool get isExists => id.value.isNotEmpty;
  DateTime get periodEnd => periodStart.add(period.duration);

  /// Whether this planned sum covers [date].
  bool covers(final DateTime date) =>
      !date.isBefore(periodStart) && !date.isAfter(periodEnd);
}
