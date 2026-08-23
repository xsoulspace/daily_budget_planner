import 'package:mobile_app/common_imports.dart';

/// Local API for commitments (recurring obligations) — primary inputs of
/// the projection engine (ADR 0002).
abstract class CommitmentsLocalApi extends ComplexLocalApi {
  /// Creates a new commitment or updates an existing one.
  Future<void> upsertCommitment(final Commitment commitment);

  /// Deletes a commitment by ID.
  Future<void> deleteCommitment(final CommitmentId id);

  /// Returns a commitment by ID, or [Commitment.empty] if not found.
  Future<Commitment> getCommitment(final CommitmentId id);

  /// Returns all active (not ended) commitments.
  Future<List<Commitment>> getAllCommitments();
}

/// Local API for planned sums per period bucket — primary inputs of the
/// projection engine (ADR 0002). One editable number per bucket;
/// records only explain drift from this plan.
abstract class PlannedSumsLocalApi extends ComplexLocalApi {
  /// Creates a new planned sum or updates an existing one.
  Future<void> upsertPlannedSum(final PlannedSum plannedSum);

  /// Deletes a planned sum by ID.
  Future<void> deletePlannedSum(final BudgetId id);

  /// Returns all planned sums covering [date].
  Future<List<PlannedSum>> getPlannedSumsForDate(final DateTime date);
}
