// ignore_for_file: file_names

import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';

/// A widget that displays a paywall for monthly subscription plans.
///
/// This paywall showcases three subscription options: yearly, quarterly,
/// and monthly. It uses a clean, appealing design that matches the app's style
/// and includes bullet points highlighting the benefits of each plan.
class Ui2024MonthlySubscriptionPaywall extends HookWidget {
  const Ui2024MonthlySubscriptionPaywall({super.key});

  @override
  Widget build(final BuildContext context) {
    final planIndex = useState<int>(2);
    final locale = useLocale(context);
    final double imageHeight =
        math.min(MediaQuery.sizeOf(context).width * 0.5, 100);
    void onBuyPressed() {}
    final textHeight = imageHeight * 0.5;
    return Scaffold(
      // backgroundColor: UiColors.biege,
      body: SafeArea(
        child: ListView(
          children: [
            AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: CupertinoNavigationBarBackButton(
                color: context.colorScheme.onSurface,
              ),
              title: Text(
                'Unlock all features!',
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'More ways to plan finances for you',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(8),
            UiDivider.size1(),
            const Gap(8),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _Block(
                            title: 'early\nfeatures',
                            dimension: textHeight,
                          ),
                          _Block(
                            image: Assets.images.paywalls.earlyFeaturesCheck,
                            dimension: imageHeight,
                          ),
                          _Block(
                            title: 'full access',
                            dimension: textHeight,
                          ),
                          _Block(
                            image: Assets.images.paywalls.openSourceHands,
                            dimension: imageHeight,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _Block(
                            image: Assets.images.paywalls.ideas,
                            dimension: imageHeight,
                          ),
                          _Block(
                            title: 'advanced customization',
                            dimension: textHeight,
                          ),
                          _Block(
                            image: Assets.images.paywalls.fullAccessHands,
                            dimension: imageHeight,
                          ),
                          _Block(
                            title: 'open source\nsupport',
                            dimension: textHeight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16),
            UiDivider.size1(),
            const Gap(16),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  const Gap(8),
                  _SubsriptionCard(
                    title: '1 month',
                    price: r'$100',
                    highlight: planIndex.value == 0,
                    onPressed: () => planIndex.value = 0,
                  ),
                  const Gap(16),
                  _SubsriptionCard(
                    title: '3 months',
                    price: r'$100',
                    highlight: planIndex.value == 1,
                    onPressed: () => planIndex.value = 1,
                  ),
                  const Gap(16),
                  _SubsriptionCard(
                    title: '1 year',
                    price: r'$100',
                    highlight: planIndex.value == 2,
                    onPressed: () => planIndex.value = 2,
                  ),
                  const Gap(8),
                ],
              ),
            ),
            const Gap(4),
            UiTextButton(
              onPressed: onBuyPressed,
              title: Row(
                children: [
                  Spacer(),
                  Text(
                    'START',
                    style: context.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(8),
                  Assets.images.paywalls.goldSnowflake.image(
                    height: 40,
                    width: 40,
                  ),
                  Spacer(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiTextButton(textTitle: 'Restore', onPressed: () {}),
                UiTextButton(textTitle: 'Terms', onPressed: () {}),
                UiTextButton(textTitle: 'Privacy', onPressed: () {}),
              ],
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}

class UiTextButton extends StatelessWidget {
  const UiTextButton({
    required this.onPressed,
    this.textTitle = '',
    this.title,
    super.key,
  });
  final String textTitle;
  final Widget? title;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => UiBaseButton(
        onPressed: onPressed,
        builder: (final context, final focused, final onlyFocused) => Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          color: Colors.transparent,
          child: title ?? Text(textTitle),
        ),
      );
}

class _SubsriptionCard extends StatelessWidget {
  const _SubsriptionCard({
    required this.title,
    required this.price,
    required this.onPressed,
    required this.highlight,
  });
  final String title;
  final String price;
  final VoidCallback onPressed;
  final bool highlight;
  @override
  Widget build(final BuildContext context) => UiBaseButton(
        onPressed: onPressed,
        builder: (final context, final focused, final onlyFocused) =>
            AnimatedContainer(
          duration: 350.milliseconds,
          padding: EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: highlight
                ? context.colorScheme.primary
                : context.colorScheme.surface,
            borderRadius: BorderRadius.all(
              Radius.elliptical(
                UiDecorators.radiusMedium,
                UiDecorators.radiusMedium,
              ),
            ),
          ),
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: highlight || focused
                  ? context.colorScheme.onPrimary
                  : context.colorScheme.onSurface,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(8),
                Text(
                  title.toUpperCase(),
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: highlight || focused
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.onSurface,
                  ),
                ),
                Gap(32),
                Text(price),
                Gap(2),
                Text('cancel anytime'),
              ],
            ),
          ),
        ),
      );
}

class _Block extends StatelessWidget {
  const _Block({
    required this.dimension,
    this.title = '',
    this.image,
    super.key,
  });

  final String title;
  final AssetGenImage? image;
  final double dimension;

  @override
  Widget build(final BuildContext context) => title.isNotEmpty
      ? ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: dimension,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      : ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: dimension,
          ),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: image?.image() ?? const SizedBox.shrink(),
          ),
        );
}
