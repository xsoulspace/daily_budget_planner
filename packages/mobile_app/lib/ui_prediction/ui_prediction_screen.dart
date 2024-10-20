import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_timeline.dart';

class UiPredictionScreen extends StatefulWidget {
  const UiPredictionScreen({super.key});

  static Future<void> show(final BuildContext context) async => Navigator.push(
        context,
        MaterialPageRoute(builder: (final context) => UiPredictionScreen()),
      );

  @override
  _UiPredictionScreenState createState() => _UiPredictionScreenState();
}

class _UiPredictionScreenState extends State<UiPredictionScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiScaffold(
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
                                      LocalizedMap(
                                        value: {
                                          languages.en: 'period',
                                          languages.it: 'periodo',
                                          languages.ru: 'период',
                                        },
                                      ).getValue(locale),
                                      textAlign: TextAlign.center,
                                      style: context.textTheme.labelSmall,
                                    ),
                                    Text(
                                      LocalizedMap(
                                        value: {
                                          languages.en: 'Week',
                                          languages.it: 'Settimana',
                                          languages.ru: 'Неделя',
                                        },
                                      ).getValue(locale),
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
                                        LocalizedMap(
                                          value: {
                                            languages.en: 'regular expenses',
                                            languages.it: 'spese regolari',
                                            languages.ru: 'регулярные расходы',
                                          },
                                        ).getValue(locale),
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
                                      LocalizedMap(
                                        value: {
                                          languages.en: 'income',
                                          languages.it: 'entrate',
                                          languages.ru: 'доход',
                                        },
                                      ).getValue(locale),
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
                SliverGap(48),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        LocalizedMap(
                          value: {
                            languages.en: 'Trend: savings left for ~2 days',
                            languages.it:
                                'Tendenza: risparmio rimanente per ~2 giorni',
                            languages.ru: 'Тренд: накоплений хватит на ~2 дня',
                          },
                        ).getValue(locale),
                        style: context.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(6),
                    Text(
                      LocalizedMap(
                        value: {
                          languages.en: r'$1000 - left',
                          languages.it: r'$1000 - rimanenti',
                          languages.ru: r'$1000 - осталось',
                        },
                      ).getValue(locale),
                      style: context.textTheme.titleLarge,
                    ),
                    Gap(24),
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
                      LocalizedMap(
                        value: {
                          languages.en: 'daily budget',
                          languages.it: 'budget giornaliero',
                          languages.ru: 'дневной бюджет',
                        },
                      ).getValue(locale),
                      style: context.textTheme.labelLarge,
                    ),
                    Gap(24),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color:
                              context.colorScheme.onSurface.withOpacity(0.05),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            LocalizedMap(
                              value: {
                                languages.en:
                                    r'Predicted - $850 | Actual - $800',
                                languages.it:
                                    r'Previsto - $850 | Effettivo - $800',
                                languages.ru: r'Прогноз - $850 | Факт - $800',
                              },
                            ).getValue(locale),
                            style: context.textTheme.titleSmall,
                          ),
                          Text(
                            LocalizedMap(
                              value: {
                                languages.en: 'expenses',
                                languages.it: 'spese',
                                languages.ru: 'расходы',
                              },
                            ).getValue(locale),
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                    Gap(24),
                    UiPredictionTimeline(
                      presentationType: PresentationType.day,
                      initialDate: _selectedDate,
                      onDateChanged: (final newDate) {
                        setState(() => _selectedDate = newDate);
                        // TODO: Update predictions based on new date
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ).toSliver(),
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
                    UiCloseButton(),
                    Spacer(),
                    UiTextButton(
                      onPressed: () {},
                      textTitle: LocalizedMap(
                        value: {
                          languages.en: 'Update Budget',
                          languages.it: 'Aggiorna Budget',
                          languages.ru: 'Обновить бюджет',
                        },
                      ).getValue(locale),
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
