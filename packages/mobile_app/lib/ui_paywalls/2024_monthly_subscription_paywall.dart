// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';

/// A widget that displays a paywall for monthly subscription plans.
///
/// This paywall showcases three subscription options: yearly, quarterly,
/// and monthly. It uses a clean, appealing design that matches the app's style
/// and includes bullet points highlighting the benefits of each plan.
class Ui2024MonthlySubscriptionPaywall extends StatelessWidget {
  const Ui2024MonthlySubscriptionPaywall({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              centerTitle: true,
              leading: CupertinoNavigationBarBackButton(),
              title: Text(
                'Unlock all features',
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'For more customization in the same speed',
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(48),
            BenefitBulletPoint(
              benefit: LocalizedMap(
                value: {
                  languages.en: 'new features early',
                  languages.it:
                      'accesso anticipato a tutte le nuove funzionalità',
                  languages.ru: 'ранний доступ ко всем новым функциям',
                },
              ).getValue(locale),
            ),
            BenefitBulletPoint(
              benefit: LocalizedMap(
                value: {
                  languages.en: 'access to all, no ads',
                  languages.it: 'accesso completo, senza banner',
                  languages.ru: 'полный доступ без рекламы',
                },
              ).getValue(locale),
            ),
            BenefitBulletPoint(
              benefit: LocalizedMap(
                value: {
                  languages.en: 'opportunity to support Open Source',
                  languages.it: 'opportunità di supportare Open Source',
                  languages.ru: 'возможность поддержать Open Source',
                },
              ).getValue(locale),
            ),
          ],
        ),
      ),
    );
  }
}

/// A widget that displays a bullet point with a benefit description.
///
/// This widget is designed to highlight individual benefits of a subscription plan.
/// It uses a bullet point icon followed by a text description.
///
/// ```dart
/// BenefitBulletPoint(
///   benefit: 'Unlimited access to all features',
///   icon: Icons.check_circle_outline,
/// )
/// ```
///
/// @ai When using this widget, ensure the benefit text is concise and clear.
/// Consider using different icons for various types of benefits.
class BenefitBulletPoint extends StatelessWidget {
  /// Creates a bullet point tile for highlighting a benefit.
  ///
  /// The [benefit] parameter is required and describes the specific advantage.
  /// The [icon] parameter is optional and defaults to a filled circle icon.
  const BenefitBulletPoint({
    required this.benefit,
    this.icon = Icons.circle,
    super.key,
  });

  /// The text describing the benefit.
  final String benefit;

  /// The icon to be displayed as the bullet point.
  final IconData icon;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                benefit,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
}

class _SubscriptionOption extends StatelessWidget {
  const _SubscriptionOption({
    required this.title,
    required this.period,
    required this.id,
    required this.benefits,
    this.isHighlighted = false,
  });

  final String title;
  final String period;
  final String id;
  final bool isHighlighted;
  final List<String> benefits;
  @override
  Widget build(final BuildContext context) => Card(
        elevation: isHighlighted ? 8 : 2,
        color: isHighlighted
            ? Theme.of(context).colorScheme.primaryContainer
            : null,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                period,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ...benefits
                  .map((final benefit) => BenefitBulletPoint(benefit: benefit)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement subscription logic
                },
                child: const Text('Subscribe'),
              ),
            ],
          ),
        ),
      );
}
