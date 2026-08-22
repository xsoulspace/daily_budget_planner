import 'package:flutter/widgets.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_pay/has_monetization.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace_monetization_foundation/xsoulspace_monetization_foundation.dart';
import 'package:xsoulspace_monetization_interface/xsoulspace_monetization_interface.dart';

/// Typedef for the result of useIsSubscriptionMonetization
typedef IsSubscriptionMonetizationResult = ({bool isSubscriptionMonetization});

/// Typedef for the result of useIsFreeMonetization
typedef IsFreeMonetizationResult = ({bool isFreeMonetization});
typedef ActiveSubscriptionResult = ({PurchaseDetailsModel? activeSubscription});

/// Hook to check if the current monetization type is subscription
IsSubscriptionMonetizationResult useIsSubscriptionMonetization(
  final BuildContext context,
) => (
  isSubscriptionMonetization: context.select<MonetizationTypeResource, bool>(
    (final value) => value.type == MonetizationType.subscription,
  ),
);

/// Hook to get the active subscription
ActiveSubscriptionResult useActiveSubscription(final BuildContext context) => (
  activeSubscription: context
      .select<ActiveSubscriptionResource, PurchaseDetailsModel?>(
        (final value) => value.isActive ? value.subscription : null,
      ),
);

/// Hook to check if the current monetization type is free
IsFreeMonetizationResult useIsFreeMonetization(final BuildContext context) => (
  isFreeMonetization: context.select<MonetizationTypeResource, bool>(
    (final value) => value.type == MonetizationType.free,
  ),
);
