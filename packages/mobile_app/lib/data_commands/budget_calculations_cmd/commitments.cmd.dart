import 'dart:math' as math;

import 'package:mobile_app/common_imports.dart';

/// Loads all commitments from local storage into [CommitmentsResource].
class LoadCommitmentsCmd with HasResources, HasLocalApis {
  const LoadCommitmentsCmd();

  Future<void> execute() async {
    final commitments = await commitmentsLocalApi.getAllCommitments();
    commitmentsResource.assignAllOrdered(commitments);
  }
}

/// Loads planned sums covering the selected date into
/// [PlannedSumsStoreResource].
class LoadPlannedSumsCmd with HasResources, HasLocalApis {
  const LoadPlannedSumsCmd();

  Future<void> execute() async {
    final config = predictionConfigResource;
    final sums = await plannedSumsLocalApi.getPlannedSumsForDate(
      config.selectedDate,
    );
    plannedSumsStoreResource.assignAllOrdered(sums);
  }
}

typedef UpsertPlannedSumCmdParams = ({PlannedSum sum});

/// Creates or updates a planned sum and refreshes runtime resources.
class UpsertPlannedSumCmd with HasResources, HasLocalApis {
  const UpsertPlannedSumCmd();

  Future<void> execute(final UpsertPlannedSumCmdParams params) async {
    await plannedSumsLocalApi.upsertPlannedSum(params.sum);
    await const LoadPlannedSumsCmd().execute();
    await const RecalculateDailyNumberCmd().execute();
  }
}

typedef RemovePlannedSumCmdParams = ({BudgetId id});

/// Deletes a planned sum and refreshes runtime resources.
class RemovePlannedSumCmd with HasResources, HasLocalApis {
  const RemovePlannedSumCmd();

  Future<void> execute(final RemovePlannedSumCmdParams params) async {
    await plannedSumsLocalApi.deletePlannedSum(params.id);
    plannedSumsStoreResource.remove(params.id);
    await const RecalculateDailyNumberCmd().execute();
  }
}

typedef UpsertCommitmentCmdParams = ({Commitment commitment});

/// Creates or updates a commitment and refreshes the runtime resource.
///
/// After this command the Home number reflects the change visibly
/// (cause-and-effect visible = trust).
class UpsertCommitmentCmd with HasResources, HasLocalApis {
  const UpsertCommitmentCmd();

  Future<void> execute(final UpsertCommitmentCmdParams params) async {
    await commitmentsLocalApi.upsertCommitment(params.commitment);
    await const LoadCommitmentsCmd().execute();
    await const RecalculateDailyNumberCmd().execute();
  }
}

typedef RemoveCommitmentCmdParams = ({CommitmentId id});

/// Deletes a commitment by ID and refreshes the runtime resources.
class RemoveCommitmentCmd with HasResources, HasLocalApis {
  const RemoveCommitmentCmd();

  Future<void> execute(final RemoveCommitmentCmdParams params) async {
    await commitmentsLocalApi.deleteCommitment(params.id);
    commitmentsResource.remove(params.id);
    await const RecalculateDailyNumberCmd().execute();
  }
}

/// Recalculates the daily number from the aggregate-first model:
///
/// daily = (income − Σ commitments in period − planned expense sums
///          + planned income sums) / days remaining in period.
///
/// Output lands in [DailyBudgetResource]; the Home contract is unchanged.
class RecalculateDailyNumberCmd with HasResources, HasLocalApis {
  const RecalculateDailyNumberCmd();

  Future<void> execute() async {
    final config = predictionConfigResource;
    final range = DateTimeRange(start: config.startDate, end: config.endDate);

    final commitmentsTotal = commitmentsResource.orderedValues.totalForRange(
      range,
    );

    final plannedSums = await plannedSumsLocalApi.getPlannedSumsForDate(
      config.selectedDate,
    );
    var plannedExpense = 0.0;
    var plannedIncome = 0.0;
    for (final sum in plannedSums) {
      switch (sum.type) {
        case TransactionType.expense:
          plannedExpense += sum.amount;
        case TransactionType.income:
          plannedIncome += sum.amount;
        case TransactionType.transferIn || TransactionType.transferOut:
          break;
      }
    }

    final balance =
        totalSumResource.balance -
        commitmentsTotal -
        plannedExpense +
        plannedIncome;

    final daysRemaining = math.max(
      1,
      config.endDate.difference(config.selectedDate).inDays + 1,
    );
    dailyBudgetResource.value = balance / daysRemaining;
  }
}
