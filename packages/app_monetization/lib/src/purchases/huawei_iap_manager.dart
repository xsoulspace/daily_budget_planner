import 'abstract_purchase_manager.dart';

/// {@template huawei_iap_manager}
/// Implementation of [AbstractPurchaseManager] using Huawei IAP.
/// {@endtemplate}
class HuaweiIapManager implements AbstractPurchaseManager {
  @override
  Future<PurchaseResult> purchaseSubscription(
    final SubscriptionDetails details,
  ) async {
    // TODO: Implement subscription purchase logic
    throw UnimplementedError();
  }

  @override
  Future<PurchaseResult> purchaseOneTimePurchase(
    final OneTimePurchaseDetails details,
  ) async {
    // TODO: Implement one-time purchase logic
    throw UnimplementedError();
  }

  @override
  Future<List<AvailableSubscription>> getAvailableSubscriptions() async {
    // TODO: Implement fetching available subscriptions
    throw UnimplementedError();
  }

  @override
  Future<List<AvailableOneTimePurchase>> getAvailableOneTimePurchases() async {
    // TODO: Implement fetching available one-time purchases
    throw UnimplementedError();
  }

  @override
  Future<PurchaseDetails> getPurchaseDetails(final String purchaseId) async {
    // TODO: Implement fetching purchase details
    throw UnimplementedError();
  }

  @override
  Future<bool> restorePurchases() async {
    // TODO: Implement restoring purchases
    throw UnimplementedError();
  }
}
