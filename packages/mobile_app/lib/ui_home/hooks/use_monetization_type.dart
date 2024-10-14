import 'package:mobile_app/common_imports.dart';

/// Typedef for the result of useIsSubscriptionMonetization
typedef IsSubscriptionMonetizationResult = ({bool isSubscriptionMonetization});

/// Typedef for the result of useIsFreeMonetization
typedef IsFreeMonetizationResult = ({bool isFreeMonetization});

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

/// Hook to check if the current monetization type is free
IsFreeMonetizationResult useIsFreeMonetization(final BuildContext context) => (
      isFreeMonetization: context.select<MonetizationStatusNotifier, bool>(
        (final value) => value.type == MonetizationType.free,
      ),
    );
