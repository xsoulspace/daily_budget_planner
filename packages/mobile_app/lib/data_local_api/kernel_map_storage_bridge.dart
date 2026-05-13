import 'dart:convert';

import 'package:from_json_to_json/from_json_to_json.dart';
import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart' show LocalDbI;

/// Kernel JSON-map bridge with one-shot legacy import.
final class KernelMapStorageBridge {
  KernelMapStorageBridge({
    required final LocalDbI localDb,
    required final StorageKernel storageKernel,
  })  : _localDb = localDb,
        _storageKernel = storageKernel;

  final LocalDbI _localDb;
  final StorageKernel _storageKernel;

  final _checkedMigrations = <String>{};

  Future<Map<String, dynamic>> readMap({
    required final String legacyKey,
    required final StorageNamespace namespace,
    required final String kernelPath,
  }) async {
    await _migrateLegacyMapIfNeeded(
      legacyKey: legacyKey,
      namespace: namespace,
      kernelPath: kernelPath,
    );
    return _readKernelMap(namespace: namespace, kernelPath: kernelPath);
  }

  Future<void> writeMap({
    required final String legacyKey,
    required final StorageNamespace namespace,
    required final String kernelPath,
    required final Map<String, dynamic> value,
  }) async {
    await _writeKernelMap(
      namespace: namespace,
      kernelPath: kernelPath,
      value: value,
    );
    await _clearLegacyKey(legacyKey);
  }

  Future<void> _migrateLegacyMapIfNeeded({
    required final String legacyKey,
    required final StorageNamespace namespace,
    required final String kernelPath,
  }) async {
    final key = _storeKey(
      legacyKey: legacyKey,
      namespace: namespace,
      kernelPath: kernelPath,
    );
    if (_checkedMigrations.contains(key)) {
      return;
    }
    _checkedMigrations.add(key);

    final legacy = await _localDb.getMap(legacyKey);
    if (legacy.isEmpty) {
      return;
    }

    final kernel = await _readKernelMap(
      namespace: namespace,
      kernelPath: kernelPath,
    );
    if (kernel.isNotEmpty) {
      await _clearLegacyKey(legacyKey);
      return;
    }

    await _writeKernelMap(
      namespace: namespace,
      kernelPath: kernelPath,
      value: legacy,
    );
    await _clearLegacyKey(legacyKey);
  }

  Future<Map<String, dynamic>> _readKernelMap({
    required final StorageNamespace namespace,
    required final String kernelPath,
  }) async {
    final raw = await _storageKernel.read(namespace: namespace, path: kernelPath);
    if (raw == null) {
      return const <String, dynamic>{};
    }
    return jsonDecodeMap(raw).whenEmptyUse(const <String, dynamic>{});
  }

  Future<void> _writeKernelMap({
    required final StorageNamespace namespace,
    required final String kernelPath,
    required final Map<String, dynamic> value,
  }) async {
    await _storageKernel.write(
      namespace: namespace,
      path: kernelPath,
      content: jsonEncode(value),
      message: 'Persist local domain model state',
    );
  }

  Future<void> _clearLegacyKey(final String legacyKey) async {
    await _localDb.setMap(key: legacyKey, value: const <String, dynamic>{});
  }

  String _storeKey({
    required final String legacyKey,
    required final StorageNamespace namespace,
    required final String kernelPath,
  }) =>
      '${namespace.value}:$legacyKey:$kernelPath';
}
