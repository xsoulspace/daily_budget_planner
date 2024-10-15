import 'package:mobile_app/common_imports.dart';

/// Typedef for the result of useIsSubscriptionMonetization
typedef IsSubscriptionMonetizationResult = ({bool isSubscriptionMonetization});

/// Typedef for the result of useIsFreeMonetization
typedef IsFreeMonetizationResult = ({bool isFreeMonetization});
typedef ActiveSubscriptionResult = ({PurchaseDetails? activeSubscription});

/// Hook to check if the current monetization type is subscription
IsSubscriptionMonetizationResult useIsSubscriptionMonetization(
  final BuildContext context,
) =>
    (
      isSubscriptionMonetization:
          context.select<MonetizationStatusNotifier, bool>(
        (final value) =>
            value.type == MonetizationType.subscription &&
            value.status != MonetizationStatus.notAvailable,
      )
    );

/// Hook to get the active subscription
ActiveSubscriptionResult useActiveSubscription(final BuildContext context) => (
      activeSubscription: context.select<SubscriptionManager, PurchaseDetails?>(
        (final value) => value.activeSubscription,
      ),
    );

/// Hook to check if the current monetization type is free
IsFreeMonetizationResult useIsFreeMonetization(final BuildContext context) => (
      isFreeMonetization: context.select<MonetizationStatusNotifier, bool>(
        (final value) => value.type == MonetizationType.free,
      ),
    );
