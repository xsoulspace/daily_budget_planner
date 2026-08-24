import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db_apis/budget_sembast.dart';
import 'package:mobile_app/data_local_api/db_apis/commitment_sembast.dart';
import 'package:sembast/sembast.dart';

final class ManualBudgetsLocalApiSembast extends ComplexLocalApi
    with HasComplexLocalDbs
    implements ManualBudgetsLocalApi {
  ManualBudgetsLocalApiSembast();
  SembastDb get _db => sembastDb;

  @override
  Future<void> upsertBudget(final Budget budget) async {
    try {
      await _db.db.transaction((final txn) async {
        final model = BudgetSembastCollection.fromDomain(budget);
        await _db.budgets.record(budget.id).put(txn, model.toMap());
      });
    } catch (e, s) {
      debugPrint('upsertBudget failed: $e\n$s');
      throw LocalApiException(
        message: 'Failed to create budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> deleteBudget(final BudgetId id) async {
    try {
      await _db.budgets.record(id).delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<Budget> getBudget(final BudgetId id) async {
    try {
      final record = await _db.budgets.record(id).get(_db.db);
      if (record == null) return Budget.empty;
      return BudgetSembastCollection.fromMap(record).item;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<Budget?> getOldestBudgetBetweenDates({
    required final DateTime startDate,
    required final DateTime endDate,
  }) async {
    final finder = Finder(
      filter: Filter.and([
        Filter.greaterThanOrEquals('date', startDate.toIso8601String()),
        Filter.lessThanOrEquals('date', endDate.toIso8601String()),
      ]),
      sortOrders: [SortOrder('date')],
      limit: 1,
    );
    final record = await _db.budgets.findFirst(_db.db, finder: finder);
    if (record == null) return null;
    return BudgetSembastCollection.fromMap(record.value).item;
  }

  @override
  Future<List<Budget>> getAllBudgetsForPeriod({
    required final Period period,
    required final DateTime startDate,
  }) async {
    final endDate = startDate.add(period.duration);
    final finder = Finder(
      filter: Filter.and([
        Filter.greaterThanOrEquals('date', startDate.toIso8601String()),
        Filter.lessThanOrEquals('date', endDate.toIso8601String()),
      ]),
      sortOrders: [SortOrder('date')],
    );
    final records = await _db.budgets.find(_db.db, finder: finder);
    return records
        .map(
          (final record) => BudgetSembastCollection.fromMap(record.value).item,
        )
        .toList();
  }

  @override
  Future<PagingControllerPageModel<Budget>> getPaginatedBudgetForPeriod({
    required final Period period,
    required final DateTime startDate,
    required final PageLimitRecord pageLimit,
  }) async {
    final endDate = startDate.add(period.duration);
    final finder = Finder(
      filter: Filter.and([
        Filter.greaterThanOrEquals('date', startDate.toIso8601String()),
        Filter.lessThanOrEquals('date', endDate.toIso8601String()),
      ]),
      sortOrders: [SortOrder('date')],
      offset: pageLimit.page * pageLimit.limit,
      limit: pageLimit.limit,
    );
    final records = await _db.budgets.find(_db.db, finder: finder);
    return PagingControllerPageModel<Budget>(
      values: records
          .map(
            (final record) =>
                BudgetSembastCollection.fromMap(record.value).item,
          )
          .toList(),
      currentPage: pageLimit.page,
      pagesCount: records.length ~/ pageLimit.limit,
    );
  }

  @override
  Future<void> deleteAllBudgets() async {
    try {
      await _db.budgets.delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all budgets',
        error: e,
        stackTrace: s,
      );
    }
  }
}

final class CommitmentsLocalApiSembast extends ComplexLocalApi
    with HasComplexLocalDbs
    implements CommitmentsLocalApi {
  CommitmentsLocalApiSembast();
  SembastDb get _db => sembastDb;

  @override
  Future<void> upsertCommitment(final Commitment commitment) async {
    try {
      await _db.db.transaction((final txn) async {
        final model = CommitmentSembastCollection.fromDomain(commitment);
        await _db.commitments.record(commitment.id).put(txn, model.toMap());
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to upsert commitment',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> deleteCommitment(final CommitmentId id) async {
    try {
      await _db.commitments.record(id).delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete commitment',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<Commitment> getCommitment(final CommitmentId id) async {
    try {
      final record = await _db.commitments.record(id).get(_db.db);
      if (record == null) return Commitment.empty;
      return CommitmentSembastCollection.fromMap(record).item;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get commitment',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<List<Commitment>> getAllCommitments() async {
    try {
      final records = await _db.commitments.find(_db.db);
      return records
          .map(
            (final record) =>
                CommitmentSembastCollection.fromMap(record.value).item,
          )
          .toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get all commitments',
        error: e,
        stackTrace: s,
      );
    }
  }
}

final class PlannedSumsLocalApiSembast extends ComplexLocalApi
    with HasComplexLocalDbs
    implements PlannedSumsLocalApi {
  PlannedSumsLocalApiSembast();
  SembastDb get _db => sembastDb;

  @override
  Future<void> upsertPlannedSum(final PlannedSum plannedSum) async {
    try {
      await _db.db.transaction((final txn) async {
        final model = PlannedSumSembastCollection.fromDomain(plannedSum);
        await _db.plannedSums.record(plannedSum.id).put(txn, model.toMap());
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to upsert planned sum',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> deletePlannedSum(final BudgetId id) async {
    try {
      await _db.plannedSums.record(id).delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete planned sum',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<List<PlannedSum>> getPlannedSumsForDate(final DateTime date) async {
    try {
      final records = await _db.plannedSums.find(_db.db);
      return records
          .map(
            (final record) =>
                PlannedSumSembastCollection.fromMap(record.value).item,
          )
          .where((final sum) => sum.covers(date))
          .toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get planned sums for date',
        error: e,
        stackTrace: s,
      );
    }
  }
}
