import 'dart:convert';

import 'package:from_json_to_json/from_json_to_json.dart';
import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart' show LocalDbI;

final class BudgetStorageBridge {
  BudgetStorageBridge({
    required final LocalDbI localDb,
    required final StorageKernel storageKernel,
    required final StorageNamespace budgetNamespace,
  })  : _localDb = localDb,
        _storageKernel = storageKernel,
        _budgetNamespace = budgetNamespace;

  final LocalDbI _localDb;
  final StorageKernel _storageKernel;
  final StorageNamespace _budgetNamespace;

  final _checkedMigrations = <String>{};

  Future<Map<String, dynamic>> readBudget({
    required final String legacyKey,
    required final String kernelPath,
  }) async {
    await _migrateLegacyBudgetIfNeeded(
      legacyKey: legacyKey,
      kernelPath: kernelPath,
    );
    return _readKernelMap(kernelPath);
  }

  Future<void> writeBudget({
    required final String legacyKey,
    required final String kernelPath,
    required final Map<String, dynamic> value,
  }) async {
    await _writeKernelMap(kernelPath: kernelPath, value: value);
    await _clearLegacyKey(legacyKey);
  }

  Future<void> _migrateLegacyBudgetIfNeeded({
    required final String legacyKey,
    required final String kernelPath,
  }) async {
    if (_checkedMigrations.contains(legacyKey)) {
      return;
    }
    _checkedMigrations.add(legacyKey);

    final legacy = await _localDb.getMap(legacyKey);
    if (legacy.isEmpty) {
      return;
    }

    final kernel = await _readKernelMap(kernelPath);
    if (kernel.isNotEmpty) {
      await _clearLegacyKey(legacyKey);
      return;
    }

    await _writeKernelMap(kernelPath: kernelPath, value: legacy);
    await _clearLegacyKey(legacyKey);
  }

  Future<Map<String, dynamic>> _readKernelMap(final String kernelPath) async {
    final raw = await _storageKernel.read(
      namespace: _budgetNamespace,
      path: kernelPath,
    );
    if (raw == null) {
      return const <String, dynamic>{};
    }
    return jsonDecodeMap(raw).whenEmptyUse(const <String, dynamic>{});
  }

  Future<void> _writeKernelMap({
    required final String kernelPath,
    required final Map<String, dynamic> value,
  }) async {
    await _storageKernel.write(
      namespace: _budgetNamespace,
      path: kernelPath,
      content: jsonEncode(value),
      message: 'Persist budget model state',
    );
  }

  Future<void> _clearLegacyKey(final String legacyKey) =>
      _localDb.setMap(key: legacyKey, value: const <String, dynamic>{});
}
