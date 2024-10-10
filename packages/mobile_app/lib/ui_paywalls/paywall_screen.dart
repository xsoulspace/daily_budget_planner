// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';

enum PaywallVersions {
  _2024Months,
}

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final paywallVersion = PaywallVersions._2024Months;
    return switch (paywallVersion) {
      PaywallVersions._2024Months => const Ui2024MonthlySubscriptionPaywall(),
    };
  }
}
