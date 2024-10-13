// ignore_for_file: constant_identifier_names

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';

enum PaywallVersions {
  _2024Months,
}

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(context.read<SubscriptionManager>().init());
  }

  @override
  Widget build(final BuildContext context) {
    final paywallVersion = PaywallVersions._2024Months;
    return switch (paywallVersion) {
      PaywallVersions._2024Months => const Ui2024MonthlySubscriptionPaywall(),
    };
  }
}
