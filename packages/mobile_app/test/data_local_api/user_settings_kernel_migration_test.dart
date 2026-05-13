import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/data_local_api/app_settings_local_api.dart';
import 'package:mobile_app/data_local_api/kernel_map_storage_bridge.dart';
import 'package:mobile_app/data_local_api/user_local_api.dart';
import 'package:mobile_app/data_models/data_models.dart';
import 'package:mobile_app/di/storage_kernel_bootstrap.dart';
import 'package:ui_locale/ui_locale.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart' show LocalDbI;

void main() {
  setUpAll(() {
    LocalizationConfig.initialize(
      LocalizationConfig(
        supportedLanguages: [languages.en, languages.ru, languages.it],
        fallbackLanguage: languages.en,
      ),
    );
  });

  group('Daily Budget kernel migration', () {
    test('UserLocalApi migrates legacy user map into kernel namespace', () async {
      final tempDir = await Directory.systemTemp.createTemp(
        'daily_budget_user_local_api_migration_',
      );
      addTearDown(() => tempDir.delete(recursive: true));

      final bootstrap = DailyBudgetStorageKernelBootstrap(
        storageRootPath: tempDir.path,
      );
      await bootstrap.initialize();
      final kernel = bootstrap.kernel;

      final localDb = _InMemoryLocalDb();
      await localDb.init();

      final user = UserModel(
        localId: const UserModelLocalId(value: 'local_1'),
        remoteId: const UserModelRemoteId(value: 'remote_1'),
        createdAt: DateTime.utc(2026, 3, 1, 12),
        updatedAt: DateTime.utc(2026, 3, 1, 12, 30),
      );
      await localDb.setMap(key: 'user', value: user.toJson());

      final api = UserLocalApi(localDb: localDb, storageKernel: kernel);
      final loaded = await api.loadUser();

      expect(loaded.toJson(), user.toJson());
      expect(await localDb.getMap('user'), isEmpty);

      final persistedRaw = await kernel.read(
        namespace: const StorageNamespace('user'),
        path: 'profile/user_v1.json',
      );
      expect(persistedRaw, isNotNull);
      final persistedMap = Map<String, dynamic>.from(
        jsonDecode(persistedRaw!) as Map,
      );
      expect(persistedMap, user.toJson());
    });

    test('AppSettingsLocalApi migrates legacy settings into kernel namespace',
        () async {
      final tempDir = await Directory.systemTemp.createTemp(
        'daily_budget_app_settings_local_api_migration_',
      );
      addTearDown(() => tempDir.delete(recursive: true));

      final bootstrap = DailyBudgetStorageKernelBootstrap(
        storageRootPath: tempDir.path,
      );
      await bootstrap.initialize();
      final kernel = bootstrap.kernel;

      final localDb = _InMemoryLocalDb();
      await localDb.init();

      const legacySettings = <String, dynamic>{'locale': 'en'};
      await localDb.setMap(key: 'settings', value: legacySettings);

      final api = AppSettingsLocalApi(localDb: localDb, storageKernel: kernel);
      await api.loadSettings();

      expect(await localDb.getMap('settings'), isEmpty);
      final persistedRaw = await kernel.read(
        namespace: StorageNamespace.settings,
        path: 'app/settings_v1.json',
      );
      expect(persistedRaw, isNotNull);
      expect(
        Map<String, dynamic>.from(jsonDecode(persistedRaw!) as Map),
        legacySettings,
      );
    });

    test('KernelMapStorageBridge migrates once and keeps kernel source of truth',
        () async {
      final tempDir = await Directory.systemTemp.createTemp(
        'daily_budget_kernel_map_bridge_migration_',
      );
      addTearDown(() => tempDir.delete(recursive: true));

      final bootstrap = DailyBudgetStorageKernelBootstrap(
        storageRootPath: tempDir.path,
      );
      await bootstrap.initialize();
      final kernel = bootstrap.kernel;

      final localDb = _InMemoryLocalDb();
      await localDb.init();

      const legacyKey = 'user';
      const kernelPath = 'profile/user_v1.json';
      const namespace = StorageNamespace('user');
      const legacyValue = <String, dynamic>{
        'localId': {'value': 'legacy_local'},
        'remoteId': {'value': 'legacy_remote'},
        'createdAt': '2026-03-01T12:00:00.000Z',
        'updatedAt': '2026-03-01T12:30:00.000Z',
      };
      await localDb.setMap(key: legacyKey, value: legacyValue);

      final bridge = KernelMapStorageBridge(
        localDb: localDb,
        storageKernel: kernel,
      );
      final loaded = await bridge.readMap(
        legacyKey: legacyKey,
        namespace: namespace,
        kernelPath: kernelPath,
      );

      expect(loaded, legacyValue);
      expect(await localDb.getMap(legacyKey), isEmpty);
      expect(await kernel.read(namespace: namespace, path: kernelPath), isNotNull);
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
