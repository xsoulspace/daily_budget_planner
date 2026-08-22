import 'package:intl/intl.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:mobile_app/common_imports.dart';

typedef UseUpsertBudgetRecord =
    ({
      Future<bool> Function() onSave,

      TextEditingController amountController,
      ValueNotifier<DateTime> selectedDate,
      FormHelperState formHelper,
    });
UseUpsertBudgetRecord useUpsertBudget({
  required final BuildContext context,

  final Transaction? initialValue,
  final BudgetId id = BudgetId.empty,
  final bool shouldPopOnSave = true,
}) {
  final amountController = useTextEditingController(
    text: initialValue?.input.amountWithTax.toString() ?? '',
  );
  final selectedDate = useState(
    initialValue?.transactionDate ?? DateTime.now(),
  );
  final formHelper = useFormHelper();

  return (
    amountController: amountController,
    selectedDate: selectedDate,
    formHelper: formHelper,
    onSave: () async {
      if (!formHelper.validate()) return false;
      final newBudget = Budget(
        id: BudgetId(id.value.whenEmptyUse(IdCreator.create())),
        input: InputMoney.fiat(
          amountWithTax: double.parse(amountController.text),
          // currencyId: CurrencyId.usd,
        ),
        date: selectedDate.value,
      );
      unawaited(const UpsertBudgetCommand().execute(newBudget));
      if (shouldPopOnSave) Navigator.of(context).pop();
      return true;
    },
  );
}

class UpsertBudgetDialog extends HookWidget {
  const UpsertBudgetDialog({
    this.id = BudgetId.empty,
    super.key,
    this.initialValue,
  });

  final Transaction? initialValue;
  final BudgetId id;
  static Future<void> show(
    final BuildContext context, {
    final Transaction? initialValue,
  }) => showDialog(
    context: context,
    builder: (final context) => UpsertBudgetDialog(initialValue: initialValue),
  );

  @override
  Widget build(final BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final locale = useLocale(context);
    final upsertBudget = useUpsertBudget(
      context: context,
      initialValue: initialValue,
      id: id,
    );

    return AlertDialog(
      insetPadding:
          screenWidth < 400 ? const EdgeInsets.symmetric(horizontal: 4) : null,
      title: Text(
        LocalizedMap(
        {
            languages.en: 'Add New Budget',
            languages.it: 'Aggiungi Nuovo Budget',
            languages.ru: 'Добавить Новый Бюджет',
          },
        ).getValue(locale),
      ),
      content: UpsertBudgetForm(upsertBudget: upsertBudget),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            LocalizedMap(
        {
                languages.en: 'Cancel',
                languages.it: 'Annulla',
                languages.ru: 'Отмена',
              },
            ).getValue(locale),
          ),
        ),
        ElevatedButton(
          onPressed: upsertBudget.onSave,
          child: Text(
            LocalizedMap(
        {
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

class UpsertBudgetForm extends StatelessWidget {
  const UpsertBudgetForm({required this.upsertBudget, super.key});

  final UseUpsertBudgetRecord upsertBudget;

  DateTime get _selectedDate => upsertBudget.selectedDate.value;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Form(
      key: upsertBudget.formHelper.formHelper.formKey,
      onPopInvokedWithResult: (final didPop, final result) {
        if (didPop) {
          unawaited(SoftKeyboard.close());
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: upsertBudget.amountController,
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxWidth: 200),
              labelText: LocalizedMap(
        {
                  languages.en: 'Amount',
                  languages.it: 'Importo',
                  languages.ru: 'Сумма',
                },
              ).getValue(locale),
            ),
            autofocus: true,
            keyboardType: TextInputType.number,
            validator: (final value) {
              if (value == null || value.isEmpty) {
                return LocalizedMap(
        {
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
        {
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
    // TODO(arenukvern): description
    const bool isTimeEabled = false;
    TimeOfDay? pickedTime;
    if (isTimeEabled) {
      pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDate),
      );
      if (pickedTime == null) return;
    }
    upsertBudget.selectedDate.value = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime?.hour ?? 0,
      pickedTime?.minute ?? 0,
    );
  }
}
