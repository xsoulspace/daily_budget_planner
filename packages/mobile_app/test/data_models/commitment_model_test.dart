import 'package:flutter/material.dart' show DateTimeRange;
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/data_models/data_models.dart';

void main() {
  group('Commitment', () {
    final monthStart = DateTime(2026, 8, 1);
    final monthEnd = DateTime(2026, 9, 1);

    test('monthly commitment charges once within its own month', () {
      final commitment = Commitment(
        id: const CommitmentId('c1'),
        amount: 350,
        period: Period.monthly,
        startedAt: DateTime(2026, 7, 15),
      );
      expect(
        commitment.totalForRange(
          DateTimeRange(start: monthStart, end: monthEnd),
        ),
        350,
      );
    });

    test('weekly commitment charges ~4 times per month', () {
      final commitment = Commitment(
        id: const CommitmentId('c2'),
        amount: 50,
        period: Period.weekly,
        startedAt: DateTime(2026, 1, 1),
      );
      final total = commitment.totalForRange(
        DateTimeRange(start: monthStart, end: monthEnd),
      );
      expect(total, greaterThanOrEqualTo(200));
      expect(total, lessThanOrEqualTo(250));
    });

    test('commitment that has not started yet charges nothing', () {
      final commitment = Commitment(
        id: const CommitmentId('c3'),
        amount: 100,
        startedAt: DateTime(2026, 12, 1),
      );
      expect(
        commitment.totalForRange(
          DateTimeRange(start: monthStart, end: monthEnd),
        ),
        0,
      );
    });

    test('ended commitment stops charging after end date', () {
      final commitment = Commitment(
        id: const CommitmentId('c4'),
        amount: 100,
        startedAt: DateTime(2026, 1, 1),
        endedAt: DateTime(2026, 8, 10),
      );
      // Started long ago, ended Aug 10 — still covers part of August.
      expect(
        commitment.totalForRange(
          DateTimeRange(start: monthStart, end: monthEnd),
        ),
        greaterThan(0),
      );
      // But nothing in September.
      expect(
        commitment.totalForRange(
          DateTimeRange(
            start: DateTime(2026, 9, 1),
            end: DateTime(2026, 10, 1),
          ),
        ),
        0,
      );
    });

    test('list extension sums commitments over a range', () {
      final commitments = [
        Commitment(amount: 100, startedAt: DateTime(2026, 1, 1)),
        Commitment(amount: 250, startedAt: DateTime(2026, 1, 1)),
      ];
      expect(
        commitments.totalForRange(
          DateTimeRange(start: monthStart, end: monthEnd),
        ),
        700,
      );
    });
  });

  group('PlannedSum', () {
    test('covers dates inside its period only', () {
      final sum = PlannedSum(
        amount: 1200,
        type: TransactionType.expense,
        periodStart: DateTime(2026, 8, 1),
        period: Period.monthly,
      );
      expect(sum.covers(DateTime(2026, 8, 15)), isTrue);
      expect(sum.covers(DateTime(2026, 7, 31)), isFalse);
      expect(sum.covers(DateTime(2026, 9, 1)), isFalse);
    });
  });
}
