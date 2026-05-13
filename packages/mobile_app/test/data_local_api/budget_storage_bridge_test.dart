import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/data_local_api/budget_storage_bridge.dart';
import 'package:mobile_app/di/storage_kernel_bootstrap.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart' show LocalDbI;

void main() {
  group('BudgetStorageBridge', () {
    test('migrates legacy monthly map into kernel namespace', () async {
      final tempDir = await Directory.systemTemp.createTemp(
        'daily_budget_monthly_bridge_migration_',
      );
      addTearDown(() => tempDir.delete(recursive: true));

      final bootstrap = DailyBudgetStorageKernelBootstrap(
        storageRootPath: tempDir.path,
      );
      await bootstrap.initialize();
      final kernel = bootstrap.kernel;

      final localDb = _InMemoryLocalDb();
      await localDb.init();

      const legacyKey = 'monthly_budget';
      const kernelPath = 'monthly/monthly_budget.json';
      const legacyValue = <String, dynamic>{
        'id': {'value': 'monthly_budget'},
        'amount': 1500.0,
        'savings': 300.0,
        'nextBudgetDay': 1773446400000,
      };
      await localDb.setMap(key: legacyKey, value: legacyValue);

      final bridge = BudgetStorageBridge(
        localDb: localDb,
        storageKernel: kernel,
        budgetNamespace: const StorageNamespace('budget'),
      );
      final loaded = await bridge.readBudget(
        legacyKey: legacyKey,
        kernelPath: kernelPath,
      );

      expect(loaded, legacyValue);
      expect(await localDb.getMap(legacyKey), isEmpty);
      expect(
        await kernel.read(
          namespace: const StorageNamespace('budget'),
          path: kernelPath,
        ),
        isNotNull,
      );
    });

    test('writes weekly map to kernel and clears legacy key', () async {
      final tempDir = await Directory.systemTemp.createTemp(
        'daily_budget_weekly_bridge_write_',
      );
      addTearDown(() => tempDir.delete(recursive: true));

      final bootstrap = DailyBudgetStorageKernelBootstrap(
        storageRootPath: tempDir.path,
      );
      await bootstrap.initialize();
      final kernel = bootstrap.kernel;

      final localDb = _InMemoryLocalDb();
      await localDb.init();

      const legacyKey = 'weekly_budget';
      const kernelPath = 'weekly/weekly_budget.json';
      const value = <String, dynamic>{
        'id': {'value': 'weekly_budget'},
        'amount': 420.0,
      };

      final bridge = BudgetStorageBridge(
        localDb: localDb,
        storageKernel: kernel,
        budgetNamespace: const StorageNamespace('budget'),
      );
      await bridge.writeBudget(
        legacyKey: legacyKey,
        kernelPath: kernelPath,
        value: value,
      );
      final loaded = await bridge.readBudget(
        legacyKey: legacyKey,
        kernelPath: kernelPath,
      );

      expect(loaded, value);
      expect(await localDb.getMap(legacyKey), isEmpty);
    });
  });
}

final class _InMemoryLocalDb implements LocalDbI {
  final _store = <String, Object?>{};

  @override
  Future<void> init() async {}

  @override
  Future<void> setMap({
    required final String key,
    required final Map<String, dynamic> value,
  }) async {
    _store[key] = Map<String, dynamic>.from(value);
  }

  @override
  Future<Map<String, dynamic>> getMap(final String key) async {
    final value = _store[key];
    if (value is Map<String, dynamic>) {
      return Map<String, dynamic>.from(value);
    }
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return <String, dynamic>{};
  }

  @override
  Future<void> setString({
    required final String key,
    required final String value,
  }) async {
    _store[key] = value;
  }

  @override
  Future<String> getString({
    required final String key,
    final String defaultValue = '',
  }) async {
    final value = _store[key];
    return value is String ? value : defaultValue;
  }

  @override
  Future<void> setBool({
    required final String key,
    required final bool value,
  }) async {
    _store[key] = value;
  }

  @override
  Future<bool> getBool({
    required final String key,
    final bool defaultValue = false,
  }) async {
    final value = _store[key];
    return value is bool ? value : defaultValue;
  }

  @override
  Future<void> setInt({required final String key, final int value = 0}) async {
    _store[key] = value;
  }

  @override
  Future<int> getInt({
    required final String key,
    final int defaultValue = 0,
  }) async {
    final value = _store[key];
    return value is int ? value : defaultValue;
  }

  @override
  Future<void> setItem<T>({
    required final String key,
    required final T value,
    required final Map<String, dynamic> Function(T) toJson,
  }) async {
    _store[key] = toJson(value);
  }

  @override
  Future<T> getItem<T>({
    required final String key,
    required final T? Function(Map<String, dynamic>) fromJson,
    required final T defaultValue,
  }) async {
    final map = await getMap(key);
    return fromJson(map) ?? defaultValue;
  }

  @override
  Future<void> setItemsList<T>({
    required final String key,
    required final List<T> value,
    required final Map<String, dynamic> Function(T) toJson,
  }) async {
    _store[key] = value.map(toJson).toList(growable: false);
  }

  @override
  Future<Iterable<T>> getItemsIterable<T>({
    required final String key,
    required final T Function(Map<String, dynamic>) fromJson,
    final List<T> defaultValue = const [],
  }) async {
    final value = _store[key];
    if (value is! List) return defaultValue;

    final result = <T>[];
    for (final rawItem in value) {
      if (rawItem is Map) {
        result.add(fromJson(Map<String, dynamic>.from(rawItem)));
      }
    }
    return result;
  }

  @override
  Future<void> setMapList({
    required final String key,
    required final List<Map<String, dynamic>> value,
  }) async {
    _store[key] = value.map(Map<String, dynamic>.from).toList(growable: false);
  }

  @override
  Future<Iterable<Map<String, dynamic>>> getMapIterable({
    required final String key,
    final List<Map<String, dynamic>> defaultValue = const [],
  }) async {
    final value = _store[key];
    if (value is! List) return defaultValue;

    final result = <Map<String, dynamic>>[];
    for (final rawItem in value) {
      if (rawItem is Map) {
        result.add(Map<String, dynamic>.from(rawItem));
      }
    }
    return result;
  }

  @override
  Future<void> setStringList({
    required final String key,
    required final List<String> value,
  }) async {
    _store[key] = List<String>.from(value);
  }

  @override
  Future<Iterable<String>> getStringsIterable({
    required final String key,
    final List<String> defaultValue = const [],
  }) async {
    final value = _store[key];
    if (value is List<String>) {
      return List<String>.from(value);
    }
    if (value is List) {
      return value.whereType<String>().toList(growable: false);
    }
    return defaultValue;
  }

  @override
  Future<void> clearKey({required final String key}) async {
    _store.remove(key);
  }

  @override
  Future<void> clearAll() async {
    _store.clear();
  }
}
