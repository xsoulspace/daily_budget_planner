import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_other/privacy_screen.dart';
import 'package:mobile_app/ui_other/terms_screen.dart';
import 'package:mobile_app/ui_pay/has_monetization.dart';
import 'package:mobile_app/ui_pay/monetization_products.dart';
import 'package:mobile_app/ui_pay/paywall_flow.dart';
import 'package:mobile_app/ui_pay/widgets/subscription_actions.dart';
import 'package:mobile_app/ui_pay/widgets/subscription_plans.dart';

/// {@template paywall_screen}
/// Paywall screen that displays subscription options and handles purchases.
/// {@endtemplate}
class PaywallScreen extends StatefulWidget {
  /// {@macro paywall_screen}
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> with HasMonetization {
  @override
  void initState() {
    super.initState();
    // Force a fresh entitlement check whenever the paywall is shown. If the
    // user has an active subscription that the local cache is unaware of
    // (fresh install, prior network failure), the subscription status
    // resource will update and routing will send them past the paywall.
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      unawaited(monetizationFoundation.checkActiveSubscription());
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: UiAppBar(
      titleText: LocalizedMap(
        {
          languages.en: 'Unlock all features',
          languages.it: 'Sblocca tutte le funzionalità',
          languages.ru: 'Разблокируйте все функции',
        },
      ).getValue(useLocale(context)),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(8),
            Text(
              LocalizedMap(
        {
                  languages.en: 'More ways to plan finances for you',
                  languages.it: 'Più modi per pianificare le tue finanze',
                  languages.ru: 'Больше способов планировать свои финансы',
                },
              ).getValue(useLocale(context)),
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(16),
            const SubscriptionPlans(),
            const Gap(16),
            const SubscriptionActions(),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: UiTextButton(
                    textTitle: LocalizedMap(
        {
                        languages.en: 'Terms',
                        languages.it: 'Termini',
                        languages.ru: 'Условия',
                      },
                    ).getValue(useLocale(context)),
                    onPressed: () async => TermsScreen.show(context),
                  ),
                ),
                Flexible(
                  child: UiTextButton(
                    textTitle: LocalizedMap(
        {
                        languages.en: 'Privacy',
                        languages.it: 'Privacy',
                        languages.ru: 'Приватность',
                      },
                    ).getValue(useLocale(context)),
                    onPressed: () async => PrivacyScreen.show(context),
                  ),
                ),
              ],
            ),
            const Gap(12),
          ],
        ),
      ),
    ),
  );
}
