import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_notifier.dart';

// Keep the existing AddBudgetDialog and BudgetForm classes here

class TransactionBottomSheet extends HookWidget {
  const TransactionBottomSheet({
    required this.type,
    this.transaction,
    super.key,
  });

  final Transaction? transaction;
  final TransactionType type;

  static Future<void> show(
    final BuildContext context, {
    required final TransactionType type,
    final Transaction? transaction,
  }) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (final context) => TransactionBottomSheet(
          transaction: transaction,
          type: type,
        ),
      );

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    assert(
      transaction != null && type == transaction?.type || true,
      'type must be either expense or income',
    );
    final amountController = useTextEditingController(
      text: transaction?.amount.toString() ?? '',
    );
    final descriptionController = useTextEditingController(
      text: transaction?.description ?? '',
    );
    final selectedDate = useState(transaction?.date ?? DateTime.now());
    final periodType = useState(
      transaction?.periodType ?? TransactionPeriodType.bySpecificDate,
    );
    final period = useState(transaction?.period ?? Period.monthly);
    final isExpense = type == TransactionType.expense;

    return Form(
      child: DraggableScrollableSheet(
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        snap: true,
        snapSizes: const [0.5, 0.95],
        builder: (final context, final scrollController) =>
            SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                transaction == null ? 'Add Transaction' : 'Edit Transaction',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TransactionForm(
                amountController: amountController,
                descriptionController: descriptionController,
                selectedDate: selectedDate,
                isExpense: isExpense,
                periodType: periodType,
                period: period,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                      if (!Form.of(context).validate()) return;
                      final newTransaction = Transaction(
                        id: transaction?.id ?? TransactionId(createId()),
                        amount: double.parse(amountController.text),
                        date: selectedDate.value,
                        description: descriptionController.text,
                        type: type,
                        periodType: periodType.value,
                        period: period.value,
                      );
                      unawaited(
                        context
                            .read<UiPredictionNotifier>()
                            .upsertTransaction(newTransaction),
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      transaction == null ? 'Add' : 'Update',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionForm extends HookWidget {
  const TransactionForm({
    required this.amountController,
    required this.descriptionController,
    required this.selectedDate,
    required this.isExpense,
    required this.periodType,
    required this.period,
    super.key,
  });

  final TextEditingController amountController;
  final TextEditingController descriptionController;
  final ValueNotifier<DateTime> selectedDate;
  final bool isExpense;
  final ValueNotifier<TransactionPeriodType> periodType;
  final ValueNotifier<Period> period;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: amountController,
          decoration: InputDecoration(
            labelText: LocalizedMap(
              value: {
                languages.en: 'Amount',
                languages.it: 'Importo',
                languages.ru: 'Сумма',
              },
            ).getValue(locale),
            prefixIcon: Icon(Icons.attach_money),
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          validator: (final value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an amount';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: descriptionController,
          decoration: InputDecoration(
            labelText: 'Description',
            prefixIcon: Icon(Icons.description),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(Icons.calendar_today),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate.value,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  selectedDate.value = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    selectedDate.value.hour,
                    selectedDate.value.minute,
                  );
                }
              },
              child: Text(DateFormat.yMMMd().format(selectedDate.value)),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(selectedDate.value),
                );
                if (pickedTime != null) {
                  selectedDate.value = DateTime(
                    selectedDate.value.year,
                    selectedDate.value.month,
                    selectedDate.value.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );
                }
              },
              child: Text(DateFormat.Hm().format(selectedDate.value)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text('Regularity:'),
        const SizedBox(height: 8),
        CupertinoSlidingSegmentedControl<TransactionPeriodType>(
          groupValue: periodType.value,
          children: {
            TransactionPeriodType.bySpecificDate: Text('Specific Date'),
            TransactionPeriodType.byDayOfWeek: Text('Day of Week'),
            TransactionPeriodType.byComputedDate: Text('Computed Date'),
          },
          onValueChanged: (final value) {
            if (value != null) {
              periodType.value = value;
            }
          },
        ),
        const SizedBox(height: 16),
        if (periodType.value == TransactionPeriodType.bySpecificDate)
          CupertinoSlidingSegmentedControl<Period>(
            groupValue: period.value,
            children: {
              Period.daily: Text('Daily'),
              Period.weekly: Text('Weekly'),
              Period.monthly: Text('Monthly'),
              Period.yearly: Text('Yearly'),
            },
            onValueChanged: (final value) {
              if (value != null) {
                period.value = value;
              }
            },
          )
        else if (periodType.value == TransactionPeriodType.byDayOfWeek)
          WeekdaySelector(
            onChanged: (final day) {
              // Handle weekday selection
            },
          )
        else if (periodType.value == TransactionPeriodType.byComputedDate)
          ComputedDateSelector(
            onChanged: (final config) {
              // Handle computed date configuration
            },
          ),
      ],
    );
  }
}

class WeekdaySelector extends StatelessWidget {
  const WeekdaySelector({required this.onChanged, super.key});
  final Function(int) onChanged;

  @override
  Widget build(final BuildContext context) => Wrap(
        spacing: 8,
        children: List.generate(
          7,
          (final index) => ChoiceChip(
            label: Text(DateFormat('E').format(DateTime(2023, 1, index + 2))),
            selected: false, // Implement selection logic
            onSelected: (final selected) => onChanged(index),
          ),
        ),
      );
}

class ComputedDateSelector extends StatelessWidget {
  const ComputedDateSelector({required this.onChanged, super.key});
  final Function(ComputedDateConfig) onChanged;

  @override
  Widget build(final BuildContext context) {
    final dateTypes = ['End of Month', 'Start of Quarter', 'End of Quarter'];
    String selectedDateType = dateTypes[0];
    int selectedDayOffset = 1;

    return Column(
      children: [
        DropdownButton<String>(
          value: selectedDateType,
          items: dateTypes
              .map(
                (final value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          onChanged: (final newValue) {
            if (newValue != null) {
              selectedDateType = newValue;
              onChanged(
                ComputedDateConfig(
                  type: selectedDateType,
                  dayOffset: selectedDayOffset,
                ),
              );
            }
          },
          hint: Text('Select computed date type'),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: CupertinoPicker(
            itemExtent: 32,
            onSelectedItemChanged: (final index) {
              selectedDayOffset = index + 1;
              onChanged(
                ComputedDateConfig(
                  type: selectedDateType,
                  dayOffset: selectedDayOffset,
                ),
              );
            },
            children: List<Widget>.generate(
              31,
              (final index) => Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ComputedDateConfig {
  ComputedDateConfig({required this.type, required this.dayOffset});
  final String type;
  final int dayOffset;
}
