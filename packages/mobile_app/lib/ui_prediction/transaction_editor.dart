import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_notifier.dart';

class AddBudgetDialog extends HookWidget {
  const AddBudgetDialog({
    this.id = BudgetId.empty,
    super.key,
    this.initialValue,
  });

  final Transaction? initialValue;
  final BudgetId id;
  static Future<void> show(
    final BuildContext context, {
    final Transaction? initialValue,
  }) =>
      showDialog(
        context: context,
        builder: (final context) => AddBudgetDialog(initialValue: initialValue),
      );

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final amountController = useTextEditingController(
      text: initialValue?.value.toString() ?? '',
    );
    final selectedDate = useState(initialValue?.date ?? DateTime.now());

    return AlertDialog(
      insetPadding:
          screenWidth < 400 ? const EdgeInsets.symmetric(horizontal: 4) : null,
      title: Text(
        LocalizedMap(
          value: {
            languages.en: 'Add New Budget',
            languages.it: 'Aggiungi Nuovo Budget',
            languages.ru: 'Добавить Новый Бюджет',
          },
        ).getValue(locale),
      ),
      content: BudgetForm(
        amountController: amountController,
        selectedDate: selectedDate,
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
            if (Form.of(context).validate()) {
              final newBudget = Budget(
                id: BudgetId(id.value.whenEmptyUse(createId())),
                amount: double.parse(amountController.text),
                date: selectedDate.value,
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

class BudgetForm extends StatefulWidget {
  const BudgetForm({
    required this.amountController,
    required this.selectedDate,
    super.key,
  });

  final TextEditingController amountController;
  final ValueNotifier<DateTime> selectedDate;
  @override
  State<BudgetForm> createState() => BudgetFormState();
}

class BudgetFormState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;

  DateTime get selectedDate => _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: widget.amountController,
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
                onPressed: () async => _selectDateTime(context),
                child: Text(DateFormat.yMMMd().add_Hm().format(_selectedDate)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateTime(final BuildContext context) async {
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
  }
}
