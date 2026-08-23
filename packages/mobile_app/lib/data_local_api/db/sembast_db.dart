import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/db.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

const _sembastDbVersion = 'sembast_1';
const _dbFileName = 'daily_budget.db';

typedef SembastDataMap = Map<String, dynamic>;

/// Sembast database implementation
final class SembastDb extends ComplexLocalDb {
  Database? _db;
  final budgets = StoreRef<BudgetId, SembastDataMap>('budgets');
  final commitments = StoreRef<CommitmentId, SembastDataMap>('commitments');
  final plannedSums = StoreRef<BudgetId, SembastDataMap>('planned_sums');
  final transactions = StoreRef<TransactionId, SembastDataMap>('transactions');
  final scheduledTransactions = StoreRef<TransactionId, SembastDataMap>(
    'scheduled_transactions',
  );
  final tasks = StoreRef<TaskId, SembastDataMap>('tasks');

  Database get db =>
      _db ??
      (throw ArgumentError.value('db is not initialized. Call open first.'));

  @override
  Future<void> open() async {
    if (_db != null) return;

    if (kIsWeb) {
      _db = await databaseFactoryWeb.openDatabase(_dbFileName);
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final dbPath = join(dir.path, _dbFileName);
      _db = await databaseFactoryIo.openDatabase(dbPath);
    }
  }

  @override
  Future<void> close() async {
    await _db?.close();
    _db = null;
  }
}

/// Mixin for handling IDs in Sembast models
mixin SembastIdMixin<T> {
  T get id;
}

abstract class SembastContainer<T extends Object, TId>
    with SembastIdMixin<TId> {
  SembastContainer({required this.item});
  static const keys = (id: 'id', jsonData: 'jsonData');
  @override
  TId get id;
  T item;
  Map<String, dynamic> getJson();
  @mustCallSuper
  @mustBeOverridden
  SembastDataMap toMap() => {
    keys.id: '$id',
    keys.jsonData: getJson().map(
      (final key, final value) => MapEntry(key, switch (value) {
        final DateTime date => date.toIso8601String(),
        _ => value,
      }),
    ),
  };
}
