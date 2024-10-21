import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'isar.g.dart';
part 'isar_budget.dart';
part 'isar_expense.dart';

const _isarDbVersion = 'isar_4';

base class ComplexLocalDb {
  const ComplexLocalDb();
  Future<void> open() async {}
  Future<void> close() async {}
}

final class MockComplexLocalDb extends ComplexLocalDb {}

final class IsarDb extends ComplexLocalDb {
  Isar? _db;
  Isar get db => _db == null
      ? throw ArgumentError.value('db is not initialzed. Call open first.')
      : _db!;
  @override
  Future<void> open() async {
    final dir = Platform.isIOS
        ? await getLibraryDirectory()
        : await getApplicationDocumentsDirectory();
    _db ??= Isar.open(
      schemas: [
        BudgetIsarCollectionSchema,
      ],
      name: _isarDbVersion,
      directory: dir.path,
    );
  }

  IsarCollection<String, BudgetIsarCollection> get budgets =>
      db.budgetIsarCollections;

  @override
  Future<void> close() async {
    _db?.close(
        // deleteFromDisk: true
        );
    _db = null;
  }
}

mixin IsarIdMixin {
  String id = '';
  @Id()
  String get isarId => id;
}
