import 'dart:async';

import '../purchases/purchase_manager.dart';
import 'subscription_manager.dart';

class PurchaseInitializer {
  PurchaseInitializer({
    required this.monetizationTypeNotifier,
    required this.subscriptionManager,
    required this.purchaseManager,
  });
  final MonetizationStatusNotifier monetizationTypeNotifier;
  final PurchaseManager purchaseManager;
  final SubscriptionManager subscriptionManager;

  StreamSubscription<PurchaseVerificationDto>? _purchaseUpdateSubscription;

  Future<void> init() async {
    monetizationTypeNotifier.setStatus(MonetizationStatus.loading);
    final isInitilaized = await purchaseManager.init();

    monetizationTypeNotifier.setStatus(
      isInitilaized
          ? MonetizationStatus.loaded
          : MonetizationStatus.notAvailable,
    );
    if (!isInitilaized) return;

    await _restoreAndListen();
  }

  Future<void> _restoreAndListen() async {
    await _restore();
    await _purchaseUpdateSubscription?.cancel();
    _purchaseUpdateSubscription =
        purchaseManager.purchasesStream.listen(_handlePurchaseUpdate);
  }

  Future<void> _restore() async {
    final result = await purchaseManager.restore();
    switch (result) {
      case RestoreSuccess(:final restoredPurchases):
        for (final purchase in restoredPurchases) {
          if (!purchase.isActive) continue;
          await subscriptionManager.handleSubscriptionUpdate(
            purchase.toVerificationDto(),
          );
        }
      case RestoreFailure():
        // Handle failure if needed
        break;
    }
  }

  Future<void> _handlePurchaseUpdate(final PurchaseVerificationDto dto) async {
    await subscriptionManager.handleSubscriptionUpdate(dto);
  }

  Future<void> dispose() async {
    await _purchaseUpdateSubscription?.cancel();
  }
}
