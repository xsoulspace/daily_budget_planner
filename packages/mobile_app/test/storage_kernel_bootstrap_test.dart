import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/di/storage_kernel_bootstrap.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';

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

        final kernel = bootstrap.kernel;
        expect(kernel, isNotNull);
        if (kernel == null) {
          fail('Storage kernel should be available after initialization');
        }

        final marker = await kernel.read(
          namespace: StorageNamespace.settings,
          path: '_rollout/kernel_bootstrap.json',
        );
        expect(marker, allOf(isNotNull, contains(tempDir.path)));

        await kernel.write(
          namespace: StorageNamespace.settings,
          path: 'smoke/value.json',
          content: '{"ok":true}',
          message: 'Bootstrap smoke write',
        );
        final value = await kernel.read(
          namespace: StorageNamespace.settings,
          path: 'smoke/value.json',
        );
        expect(value, '{"ok":true}');
      },
    );

    test('throws when disabled', () async {
      final bootstrap = DailyBudgetStorageKernelBootstrap(enabled: false);

      expect(bootstrap.isReady, isFalse);
      expect(() => bootstrap.initialize(), throwsStateError);
    });
  });
}
