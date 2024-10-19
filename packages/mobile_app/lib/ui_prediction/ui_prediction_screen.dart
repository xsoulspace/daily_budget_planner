import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';

class UiPredictionScreen extends StatelessWidget {
  const UiPredictionScreen({super.key});
  static Future<void> show(final BuildContext context) async => Navigator.push(
        context,
        MaterialPageRoute(builder: (final context) => UiPredictionScreen()),
      );

  @override
  Widget build(final BuildContext context) => UiScaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  PinnedHeaderSliver(
                    // TODO(arenukvern): add background iOS like frost effect
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        border: Border.all(
                          color: context.colorScheme.onSurface.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          UiSafeArea.top(),
                          Gap(12),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                /// week, month, quarter, year
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'period',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall,
                                      ),
                                      Text(
                                        'Week',
                                        style: context.textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(6),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'regular expenses',
                                          style: context.textTheme.labelSmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.arrow_drop_down_rounded),
                                          Text(
                                            r'$100',
                                            style: context.textTheme.titleLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(6),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'income',
                                        style: context.textTheme.labelSmall,
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.arrow_drop_up_rounded),
                                          Text(
                                            r'$100',
                                            style: context.textTheme.titleLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(8),
                          UiIOSDragHandle(),
                        ],
                      ),
                    ),
                  ),
                  // Expenses Graph
                  SliverFillRemaining(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Gap(12),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              r'$100',
                              style: context.textTheme.displayLarge,
                            ),
                            Gap(4),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.copy),
                            ),
                          ],
                        ),
                        Text(
                          'Daily Budget',
                          style: context.textTheme.labelLarge,
                        ),
                        Gap(16),
                        Text(
                          r'$1000 - money left',
                          style: context.textTheme.titleLarge,
                        ),
                        Gap(12),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: context.colorScheme.surface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: context.colorScheme.onSurface
                                  .withOpacity(0.05),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                r'Predicted - $850 | Actual - $800',
                                style: context.textTheme.titleSmall,
                              ),
                              Text(
                                'Expenses',
                                style: context.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        Gap(24),
                        SizedBox(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              /// Can be days, weeks, months, years.
                              UiPredictionDay(day: 'S'),
                              UiPredictionDay(day: 'M'),
                              UiPredictionDay(day: 'T'),
                              UiPredictionDay(day: 'W'),
                              UiPredictionDay(day: 'T'),
                              UiPredictionDay(day: 'F'),
                              UiPredictionDay(day: 'S'),
                              UiPredictionDay(day: 'S'),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_drop_up_rounded),
                        Text('Tuesday, 20 October'),
                        Gap(12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                border: Border.all(
                  color: context.colorScheme.onSurface.withOpacity(0.05),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(8),
                  Row(
                    children: [
                      UiBackButton(),
                      Spacer(),
                      UiTextButton(
                        onPressed: () {},
                        textTitle: 'Update Budget',
                      ),
                    ],
                  ),
                  Gap(6),
                  UiSafeArea.bottom(),
                ],
              ),
            ),
          ],
        ),
      );
}

class UiIOSDragHandle extends StatelessWidget {
  const UiIOSDragHandle({super.key});

  @override
  Widget build(final BuildContext context) => Center(
        child: Container(
          width: 36,
          height: 5,
          decoration: BoxDecoration(
            color: context.colorScheme.onSurface.withOpacity(0.3),
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
      );
}

class UiPredictionDay extends StatelessWidget {
  const UiPredictionDay({required this.day, super.key});
  final String day;

  @override
  Widget build(final BuildContext context) => Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(),
        ),
        child: Center(
          child: Text(day),
        ),
      );
}
