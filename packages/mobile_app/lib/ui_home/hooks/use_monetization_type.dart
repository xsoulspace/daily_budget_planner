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
          context.select<MonetizationTypeNotifier, bool>(
        (final value) => value.type == MonetizationType.subscription,
      ),
    );

/// Hook to check if the current monetization type is free
IsFreeMonetizationResult useIsFreeMonetization(final BuildContext context) => (
      isFreeMonetization: context.select<MonetizationTypeNotifier, bool>(
        (final value) => value.type == MonetizationType.free,
      ),
    );
