import 'dart:async';

import 'purchase_manager.dart';

class NoopPurchaseManager implements PurchaseManager {
  @override
  Future<void> dispose() async {
    await _streamController.close();
  }

  @override
  Future<PurchaseResult> buyConsumable(final PurchaseProductDetails details) {
    throw UnsupportedError('');
  }

  @override
  Future<PurchaseResult> buyNonConsumable(
    final PurchaseProductDetails details,
  ) {
    throw UnsupportedError('');
  }

  @override
  Future<CancelResult> cancel(final PurchaseProductDetails details) =>
      throw UnsupportedError('');

  @override
  Future<CompletePurchaseResult> completePurchase(
    final PurchaseVerificationDto dto,
  ) =>
      throw UnsupportedError('');

  @override
  Future<PurchaseDetails> getPurchaseInfo(final PurchaseId purchaseId) async {
    // final purchase = await IapClient.getOwnedPurchase(purchaseId.value);
    // return _mapToPurchaseDetails(purchase);
    throw UnsupportedError('');
  }

  @override
  Future<List<PurchaseProductDetails>> getConsumables(
    final List<PurchaseProductId> productIds,
  ) async =>
      [];

  @override
  Future<List<PurchaseProductDetails>> getNonConsumables(
    final List<PurchaseProductId> productIds,
  ) async =>
      [];

  @override
  Future<List<PurchaseProductDetails>> getSubscriptions(
    final List<PurchaseProductId> productIds,
  ) async =>
      [];

  @override
  Future<bool> init() async => false;

  @override
  Future<bool> isAvailable() async => false;

  @override
  Future<void> openSubscriptionManagement() async {}
  final _streamController =
      StreamController<PurchaseVerificationDto>.broadcast();
  @override
  Stream<PurchaseVerificationDto> get purchasesStream =>
      _streamController.stream;

  @override
  Future<RestoreResult> restore() async => RestoreResult.failure('');

  @override
  Future<PurchaseResult> subscribe(final PurchaseProductDetails details) =>
      throw UnsupportedError('');
}
