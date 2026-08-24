import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/di/storage_kernel_bootstrap.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';

/// Pins [getApplicationSupportDirectory] to a throwaway directory.
final class _FakePathProviderPlatform extends PathProviderPlatform {
  _FakePathProviderPlatform(this.supportPath);
  final String supportPath;

  @override
  Future<String?> getApplicationSupportPath() =>
      Future<String>.value(supportPath);
}

void main() {
  group('DailyBudgetStorageKernelBootstrap', () {
    test(
      'initializes storage kernel and supports read/write smoke flow',
      () async {
        final tempDir = await Directory.systemTemp.createTemp(
          'daily_budget_storage_kernel_bootstrap_test_',
        );
        addTearDown(() => tempDir.delete(recursive: true));

        final bootstrap = DailyBudgetStorageKernelBootstrap(
          storageRootPath: tempDir.path,
        );
        await bootstrap.initialize();

        expect(bootstrap.isReady, isTrue);

        final marker = await bootstrap.kernel.read(
          namespace: StorageNamespace.settings,
          path: '_rollout/kernel_bootstrap.json',
        );
        expect(marker, allOf(isNotNull, contains(tempDir.path)));

        await bootstrap.kernel.write(
          namespace: StorageNamespace.settings,
          path: 'smoke/value.json',
          content: '{"ok":true}',
          message: 'Bootstrap smoke write',
        );
        final value = await bootstrap.kernel.read(
          namespace: StorageNamespace.settings,
          path: 'smoke/value.json',
        );
        expect(value, '{"ok":true}');
      },
    );

    test('throws when disabled', () {
      final bootstrap = DailyBudgetStorageKernelBootstrap(enabled: false);

      expect(bootstrap.isReady, isFalse);
      expect(bootstrap.initialize, throwsStateError);
    });

    test(
      'resolves relative roots against the app support directory (iOS sandbox)',
      () async {
        final supportDir = await Directory.systemTemp.createTemp(
          'daily_budget_storage_kernel_support_test_',
        );
        addTearDown(() => supportDir.delete(recursive: true));

        final previousPlatform = PathProviderPlatform.instance;
        PathProviderPlatform.instance = _FakePathProviderPlatform(
          supportDir.path,
        );
        addTearDown(() {
          PathProviderPlatform.instance = previousPlatform;
        });

        final bootstrap = DailyBudgetStorageKernelBootstrap();
        await bootstrap.initialize();

        expect(bootstrap.isReady, isTrue);
        final resolvedRoot = bootstrap.resolvedRootPath;
        expect(
          resolvedRoot,
          p.join(supportDir.path, '.us_daily_budget_planner'),
        );
        expect(Directory(resolvedRoot!).existsSync(), isTrue);
      },
    );
  });
}
