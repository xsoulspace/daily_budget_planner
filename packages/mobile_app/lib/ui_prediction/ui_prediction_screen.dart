// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';
import 'package:mobile_app/ui_prediction/transaction_editor.dart';
import 'package:mobile_app/ui_prediction/ui_incomes_view.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_notifier.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_timeline.dart';

class UiPredictionScreen extends StatefulWidget {
  const UiPredictionScreen({super.key});

  static Future<void> show(final BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (final _) => const UiPredictionScreen()),
      );

  @override
  _UiPredictionScreenState createState() => _UiPredictionScreenState();
}

class _UiPredictionScreenState extends State<UiPredictionScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(final BuildContext context) {
    final uiPredictionNotifier = context.watch<UiPredictionNotifier>();
    final state = uiPredictionNotifier.value;

    return UiScaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                _PredictionHeader(state: state),
                const SliverGap(48),
                _PredictionBody(
                  selectedDate: _selectedDate,
                  onDateChanged: (final newDate) =>
                      setState(() => _selectedDate = newDate),
                  uiPredictionNotifier: uiPredictionNotifier,
                ).toSliver(),
              ],
            ),
          ),
          _BottomActionBar(),
        ],
      ),
    );
  }
}

class _PredictionHeader extends StatelessWidget {
  const _PredictionHeader({required this.state});

  final UiPredictionState state;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return PinnedHeaderSliver(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.surface.withOpacity(0.5),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(16)),
          border:
              Border.all(color: context.colorScheme.onSurface.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            UiSafeArea.top(),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  _HeaderItem(
                    onPressed: () async => UiIncomesView.show(context: context),
                    title: LocalizedMap(
                      value: {
                        languages.en: 'period',
                        languages.it: 'periodo',
                        languages.ru: 'период',
                      },
                    ).getValue(locale),
                    value: LocalizedMap(
                      value: {
                        languages.en: 'Week',
                        languages.it: 'Settimana',
                        languages.ru: 'Неделя',
                      },
                    ).getValue(locale),
                  ),
                  const Gap(6),
                  _HeaderItem(
                    onPressed: () async => UiIncomesView.show(context: context),
                    title: LocalizedMap(
                      value: {
                        languages.en: 'regular expenses',
                        languages.it: 'spese regolari',
                        languages.ru: 'регулярные расходы',
                      },
                    ).getValue(locale),
                    value: '\$${state.regularExpensesSum.toStringAsFixed(2)}',
                    icon: Icons.arrow_drop_down_rounded,
                  ),
                  const Gap(6),
                  _HeaderItem(
                    onPressed: () async => UiIncomesView.show(
                      context: context,
                      isRegular: true,
                    ),
                    title: LocalizedMap(
                      value: {
                        languages.en: 'regular income',
                        languages.it: 'entrate regolari',
                        languages.ru: 'регулярные доходы',
                      },
                    ).getValue(locale),
                    value: '\$${state.regularIncomesSum.toStringAsFixed(2)}',
                    icon: Icons.arrow_drop_up_rounded,
                  ),
                ],
              ),
            ),
            const Gap(8),
          ],
        ),
      ),
    );
  }
}

class _HeaderItem extends StatelessWidget {
  const _HeaderItem({
    required this.title,
    required this.value,
    required this.onPressed,
    this.icon,
  });

  final String title;
  final String value;
  final IconData? icon;
  final VoidCallback onPressed;
  @override
  Widget build(final BuildContext context) => Expanded(
        child: UiTextButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: context.textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon),
                  Text(
                    value,
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class _PredictionBody extends StatelessWidget {
  const _PredictionBody({
    required this.selectedDate,
    required this.onDateChanged,
    required this.uiPredictionNotifier,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final UiPredictionNotifier uiPredictionNotifier;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TrendIndicator(),
        const Gap(6),
        _BudgetButton(uiPredictionNotifier: uiPredictionNotifier),
        const Gap(24),
        _DailyBudgetDisplay(
          dailyBudget: uiPredictionNotifier.value.dailyBudget,
        ),
        const Gap(24),
        UiPredictionTimeline(
          presentationType: PresentationType.day,
          initialDate: selectedDate,
          onDateChanged: onDateChanged,
        ),
        const Gap(28),
        _DailyStatistics(
          selectedDate: selectedDate,
          uiPredictionNotifier: uiPredictionNotifier,
        ),
      ],
    );
  }
}

class _TrendIndicator extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.trending_up_rounded,
            size: 16,
            color: context.colorScheme.onSurface.withOpacity(0.3),
          ),
          const Gap(4),
          Text(
            LocalizedMap(
              value: {
                languages.en: 'Trend: savings left for ~2 days',
                languages.it: 'Tendenza: risparmio rimanente per ~2 giorni',
                languages.ru: 'Тренд: накоплений хватит на ~2 дня',
              },
            ).getValue(locale),
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _BudgetButton extends StatelessWidget {
  const _BudgetButton({required this.uiPredictionNotifier});

  final UiPredictionNotifier uiPredictionNotifier;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiBaseButton(
      onPressed: () async => BudgetBottomSheet.show(context),
      builder: (final _, final __, final ___) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 16,
            color: context.colorScheme.onSurface.withOpacity(0.8),
          ),
          const Gap(8),
          Text(
            '\$${uiPredictionNotifier.recentBudget.amount.toStringAsFixed(2)} ${LocalizedMap(
              value: {
                languages.en: ' - left',
                languages.it: ' - rimanenti',
                languages.ru: ' - осталось',
              },
            ).getValue(locale)}',
            style: context.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class _DailyBudgetDisplay extends StatelessWidget {
  const _DailyBudgetDisplay({required this.dailyBudget});

  final double dailyBudget;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '\$${dailyBudget.toStringAsFixed(2)}',
              style: context.textTheme.displayLarge,
            ),
            const Gap(4),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.copy),
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
      ],
    );
  }
}

class _DailyStatistics extends StatelessWidget {
  const _DailyStatistics({
    required this.selectedDate,
    required this.uiPredictionNotifier,
  });

  final DateTime selectedDate;
  final UiPredictionNotifier uiPredictionNotifier;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final expense = uiPredictionNotifier.getExpenseFor(selectedDate);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          _StatisticItem(
            value: '-\$${expense.expense.toStringAsFixed(2)}',
            label: LocalizedMap(
              value: {
                languages.en: 'Expenses',
                languages.it: 'Spese',
                languages.ru: 'Расходы',
              },
            ).getValue(locale),
          ),
          _StatisticItem(
            value: '+\$${expense.income.toStringAsFixed(2)}',
            label: LocalizedMap(
              value: {
                languages.en: 'Income',
                languages.it: 'Entrate',
                languages.ru: 'Доходы',
              },
            ).getValue(locale),
          ),
          _StatisticItem(
            value: '\$${expense.balance.toStringAsFixed(2)}',
            label: LocalizedMap(
              value: {
                languages.en: 'End of Day Balance',
                languages.it: 'Saldo finale',
                languages.ru: 'Остаток на конец дня',
              },
            ).getValue(locale),
          ),
        ],
      ),
    );
  }
}

class _StatisticItem extends StatelessWidget {
  const _StatisticItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(final BuildContext context) => AnimatedContainer(
        duration: 200.milliseconds,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.colorScheme.onSurface.withOpacity(0.05),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(label, style: context.textTheme.labelSmall),
          ],
        ),
      );
}

class _BottomActionBar extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        border:
            Border.all(color: context.colorScheme.onSurface.withOpacity(0.05)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(8),
          Row(
            children: [
              const UiCloseButton(),
              const Spacer(),
              UiTextButton(
                onPressed: () async => AddBudgetDialog.show(context),
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
          const Gap(6),
          UiSafeArea.bottom(),
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

class BudgetBottomSheet extends HookWidget {
  const BudgetBottomSheet({super.key});

  static Future<void> show(final BuildContext context) async =>
      showModalBottomSheet(
        useRootNavigator: true,
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (final context) => DraggableScrollableSheet(
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (final _, final controller) => BudgetBottomSheet(),
        ),
      );

  @override
  Widget build(final BuildContext context) {
    final uiPredictionNotifier = context.watch<UiPredictionNotifier>();
    final state = uiPredictionNotifier.value;
    final locale = useLocale(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UiIOSDragHandle(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Text(
              LocalizedMap(
                value: {
                  languages.en: 'Budgets History',
                  languages.it: 'Storico Budget',
                  languages.ru: 'История Бюджетов',
                },
              ).getValue(locale),
              style: context.textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.budgets.length,
              itemBuilder: (final context, final index) {
                final budget = state.budgets[index];
                return ListTile(
                  title: Text('\$${budget.amount.toStringAsFixed(2)}'),
                  subtitle: Text(
                    DateFormat('EEEE, d MMMM yyyy, h:mm a').format(budget.date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () async =>
                        uiPredictionNotifier.removeBudget(budget.id),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () async => AddBudgetDialog.show(context),
              child: Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Add New Budget',
                    languages.it: 'Aggiungi Nuovo Budget',
                    languages.ru: 'Добавить Новый Бюджет',
                  },
                ).getValue(locale),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
