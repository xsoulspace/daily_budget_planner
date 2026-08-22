// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/data_local_api/data_local_api.dart';
import 'package:mobile_app/di/di.dart';
import 'package:mobile_app/router.dart';
import 'package:mobile_app/ui_pay/has_monetization.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';
import 'package:xsoulspace_monetization_foundation/xsoulspace_monetization_foundation.dart';
import 'package:xsoulspace_monetization_interface/xsoulspace_monetization_interface.dart';

/// Local persistence for app-specific purchase flags (not provider data).
///
/// Currently manages the "purchase congrats seen" flag so we can show
/// a congratulations screen exactly once after a successful upgrade,
/// including after a cold start.
class PurchaseFlagsLocalApi {
  /// {@macro purchase_flags_local_api}
  PurchaseFlagsLocalApi({required this.localDb});
  final LocalDbI localDb;

  /// Key for the congrats screen shown flag.
  static const purchaseCongratsSeenKey = 'purchase_congrats_seen';

  static String _combinedKey(final PurchaseId purchaseId) =>
      '$purchaseCongratsSeenKey:$purchaseId';

  /// Returns true if the congrats screen has already been seen.
  Future<bool> isPurchaseCongratsSeen({required final PurchaseId purchaseId}) =>
      localDb.getBool(key: _combinedKey(purchaseId));

  /// Sets the congrats seen flag.
  Future<void> setPurchaseCongratsSeen({
    required final PurchaseId purchaseId,
  }) => localDb.setBool(key: _combinedKey(purchaseId), value: true);

  /// Returns true if we should show congrats now (i.e., not seen yet).
  Future<bool> shouldShowCongrats({
    required final PurchaseId purchaseId,
  }) async {
    final seen = await isPurchaseCongratsSeen(purchaseId: purchaseId);
    return !seen;
  }
}

abstract final class PaywallFlow with HasMonetization {
  static Future<void> goToPaywall(final BuildContext context) async {
    if (context.mounted) {
      AppPathsController.of(context).toPaywall();
    }
  }

  static Future<void> passPaywall(
    final BuildContext context, {
    final bool shouldRedirect = true,
  }) async {
    if (context.mounted && shouldRedirect) {
      AppPathsController.of(context).toHome();
    }
  }

  static Future<void> handleSubscriptionSuccess(
    final BuildContext context,
  ) async {
    final activeSubscription = Di.get<ActiveSubscriptionResource>();
    await Di.get<PurchaseFlagsLocalApi>().setPurchaseCongratsSeen(
      purchaseId: activeSubscription.subscription.purchaseId,
    );
    if (context.mounted) {
      AppPathsController.of(context).toHome();
    }
  }

  static VoidCallback listenResolvePendingThenRecheck({
    required final BuildContext context,
  }) {
    final subscriptionStatus = Di.get<SubscriptionStatusResource>();

    Future<void> handleResolved() async {
      await checkSubscriptionStatus(
        context,
        shouldRedirectHomeWithoutSubscription: false,
      );
    }

    void listener() {
      if (!subscriptionStatus.isPendingConfirmation) {
        subscriptionStatus.removeListener(listener);
        unawaited(handleResolved());
      }
    }

    subscriptionStatus.addListener(listener);
    return () => subscriptionStatus.removeListener(listener);
  }

  static Future<void> checkSubscriptionStatus(
    final BuildContext context, {
    final bool shouldRedirectHomeWithoutSubscription = true,
    final bool shouldRestore = true,
  }) async {
    final monetization = Di.get<MonetizationFoundation>();
    final subscriptionStatus = Di.get<SubscriptionStatusResource>();
    final activeSubscription = Di.get<ActiveSubscriptionResource>();
    final purchaseFlagsLocalApi = Di.get<PurchaseFlagsLocalApi>();

    try {
      if (subscriptionStatus.isPendingConfirmation) {
        if (context.mounted) {
          AppPathsController.of(context).toWaitingPayConfirmation();
        }
        return;
      }

      if (subscriptionStatus.isSubscribed) {
        if (await purchaseFlagsLocalApi.shouldShowCongrats(
              purchaseId: activeSubscription.subscription.purchaseId,
            ) &&
            context.mounted) {
          if (context.mounted) {
            AppPathsController.of(context).toThanksForSubscribing();
          }
          return;
        }
        if (context.mounted) {
          return passPaywall(context);
        }
        return;
      }

      if (shouldRedirectHomeWithoutSubscription && context.mounted) {
        AppPathsController.of(context).toHome();
      }
    } on Object catch (error, stackTrace) {
      debugPrint('PaywallFlow.checkSubscriptionStatus: $error');
      debugPrint('PaywallFlow.checkSubscriptionStatus: $stackTrace');
    } finally {
      unawaited(
        monetization.checkActiveSubscription(shouldRestore: shouldRestore),
      );
    }
  }
}
