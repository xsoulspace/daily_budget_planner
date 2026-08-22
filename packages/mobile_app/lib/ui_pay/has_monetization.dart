import 'package:mobile_app/di/di.dart';
import 'package:xsoulspace_monetization_foundation/xsoulspace_monetization_foundation.dart';

/// Mixin providing access to monetization foundation resources.
mixin HasMonetization {
  /// {@macro has_monetization_foundation}
  PurchasePaywallErrorResource get purchasePaywallErrorResource => Di.get();

  /// {@macro has_monetization_foundation}
  AvailableSubscriptionsResource get availableSubscriptionsResource => Di.get();

  /// {@macro has_monetization_foundation}
  ActiveSubscriptionResource get activeSubscriptionResource => Di.get();

  /// {@macro has_monetization_foundation}
  MonetizationStoreStatusResource get monetizationStoreStatusResource =>
      Di.get();

  /// {@macro has_monetization_foundation}
  MonetizationTypeResource get monetizationTypeResource => Di.get();

  /// {@macro has_monetization_foundation}
  SubscriptionStatusResource get subscriptionStatusResource => Di.get();

  /// {@macro has_monetization_foundation}
  MonetizationFoundation get monetizationFoundation => Di.get();

  /// {@macro has_monetization_foundation}
  PaywallSelectedSubscriptionResource get paywallSelectedSubscriptionResource =>
      Di.get();
}
