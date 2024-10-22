// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_notifier.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_timeline.dart';
import 'package:mobile_app/ui_prediction/wip/expensess_prediction_models.dart';

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
    final uiPredictionNotifier = context.watch<UiPredictionNotifier>();
    final state = uiPredictionNotifier.value;
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_drop_down_rounded),
                                        Text(
                                          '\$${state.regularExpensesSum.toStringAsFixed(2)}',
                                          style: context.textTheme.titleLarge,
                                          textAlign: TextAlign.center,
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
                                          languages.en: 'regular income',
                                          languages.it: 'entrate regolari',
                                          languages.ru: 'регулярные доходы',
                                        },
                                      ).getValue(locale),
                                      style: context.textTheme.labelSmall,
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_drop_up_rounded),
                                        Text(
                                          '\$${state.regularIncomesSum.toStringAsFixed(2)}',
                                          style: context.textTheme.titleLarge,
                                          textAlign: TextAlign.center,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.trending_up_rounded,
                            size: 16,
                            color:
                                context.colorScheme.onSurface.withOpacity(0.3),
                          ),
                          Gap(4),
                          Text(
                            LocalizedMap(
                              value: {
                                languages.en: 'Trend: savings left for ~2 days',
                                languages.it:
                                    'Tendenza: risparmio rimanente per ~2 giorni',
                                languages.ru:
                                    'Тренд: накоплений хватит на ~2 дня',
                              },
                            ).getValue(locale),
                            style: context.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Gap(6),
                    UiBaseButton(
                      onPressed: () async => BudgetBottomSheet.show(context),
                      builder:
                          (final context, final isPressed, final isHovered) =>
                              Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history,
                            size: 16,
                            color:
                                context.colorScheme.onSurface.withOpacity(0.8),
                          ),
                          Gap(8),
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
                    ),
                    Gap(24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${state.dailyBudget.toStringAsFixed(2)}',
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
                    UiPredictionTimeline(
                      presentationType: PresentationType.day,
                      initialDate: _selectedDate,
                      onDateChanged: (final newDate) {
                        setState(() => _selectedDate = newDate);
                        // TODO: Update predictions based on new date
                      },
                    ),
                    Gap(24),
                    Gap(4),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 300,
                      ),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: 200.milliseconds,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
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
                                  '-\$${uiPredictionNotifier.getExpenseFor(_selectedDate).expense.toStringAsFixed(2)}',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  LocalizedMap(
                                    value: {
                                      languages.en: 'Expenses',
                                      languages.it: 'Spese',
                                      languages.ru: 'Расходы',
                                    },
                                  ).getValue(locale),
                                  style: context.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: 200.milliseconds,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
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
                                  '+\$${uiPredictionNotifier.getExpenseFor(_selectedDate).income.toStringAsFixed(2)}',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  LocalizedMap(
                                    value: {
                                      languages.en: 'Income',
                                      languages.it: 'Entrate',
                                      languages.ru: 'Доходы',
                                    },
                                  ).getValue(locale),
                                  style: context.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: 200.milliseconds,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
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
                                  '\$${uiPredictionNotifier.getExpenseFor(_selectedDate).balance.toStringAsFixed(2)}',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  LocalizedMap(
                                    value: {
                                      languages.en: 'End of Day Balance',
                                      languages.it: 'Saldo finale',
                                      languages.ru: 'Остаток на конец дня',
                                    },
                                  ).getValue(locale),
                                  style: context.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

class AddBudgetDialog extends StatefulWidget {
  const AddBudgetDialog({super.key});

  static Future<void> show(final BuildContext context) => showDialog(
        context: context,
        builder: (final context) => const AddBudgetDialog(),
      );

  @override
  State<AddBudgetDialog> createState() => _AddBudgetDialogState();
}

class _AddBudgetDialogState extends State<AddBudgetDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    return AlertDialog(
      insetPadding:
          screenWidth < 400 ? EdgeInsets.symmetric(horizontal: 4) : null,
      title: Text(
        LocalizedMap(
          value: {
            languages.en: 'Add New Budget',
            languages.it: 'Aggiungi Nuovo Budget',
            languages.ru: 'Добавить Новый Бюджет',
          },
        ).getValue(locale),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: LocalizedMap(
                  value: {
                    languages.en: 'Amount',
                    languages.it: 'Importo',
                    languages.ru: 'Сумма',
                  },
                ).getValue(locale),
              ),
              keyboardType: TextInputType.number,
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return LocalizedMap(
                    value: {
                      languages.en: 'Please enter an amount',
                      languages.it: 'Inserisci un importo',
                      languages.ru: 'Пожалуйста, введите сумму',
                    },
                  ).getValue(locale);
                }
                return null;
              },
            ),
            const Gap(16),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  LocalizedMap(
                    value: {
                      languages.en: 'Date: ',
                      languages.it: 'Data: ',
                      languages.ru: 'Дата: ',
                    },
                  ).getValue(locale),
                ),
                TextButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate == null) return;
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(_selectedDate),
                    );
                    if (pickedTime == null) return;
                    setState(() {
                      _selectedDate = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  },
                  child:
                      Text(DateFormat.yMMMd().add_Hm().format(_selectedDate)),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            LocalizedMap(
              value: {
                languages.en: 'Cancel',
                languages.it: 'Annulla',
                languages.ru: 'Отмена',
              },
            ).getValue(locale),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final amount = double.parse(_amountController.text);
              final newBudget = Budget(
                id: BudgetId(createId()),
                amount: amount,
                date: _selectedDate,
              );
              unawaited(
                context
                    .read<UiPredictionNotifier>()
                    .upsertBudget(newBudget, isNew: true),
              );
              Navigator.of(context).pop();
            }
          },
          child: Text(
            LocalizedMap(
              value: {
                languages.en: 'Add',
                languages.it: 'Aggiungi',
                languages.ru: 'Добавить',
              },
            ).getValue(locale),
          ),
        ),
      ],
    );
  }
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
