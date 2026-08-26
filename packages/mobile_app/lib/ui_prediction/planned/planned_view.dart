import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_kit/molecules/ui_modal_sheet_route.dart';

Future<void> showPlannedView({required final BuildContext context}) =>
    Navigator.of(context, rootNavigator: true).push(
      UiModalSheetRoute<void>(
        builder: (final _) => const UiBottomSheetWrapper(child: PlannedView()),
      ),
    );

class PlannedView extends StatelessWidget {
  const PlannedView({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final strings = _PlannedStrings(locale);
    final items = context.watch<PlannedSumsStoreResource>().orderedValues;
    final expenseItems = items
        .where((final e) => e.type == TransactionType.expense)
        .toList();
    final incomeItems = items
        .where((final e) => e.type == TransactionType.income)
        .toList();

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(title: Text(strings.title)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _UpsertPlannedSumSheet.show(context),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _BucketSection(
            title: strings.expenses,
            emptyText: strings.emptyExpenses,
            items: expenseItems,
          ),
          const Gap(24),
          _BucketSection(
            title: strings.incomes,
            emptyText: strings.emptyIncomes,
            items: incomeItems,
          ),
        ],
      ),
    );
  }
}

class _BucketSection extends StatelessWidget {
  const _BucketSection({
    required this.title,
    required this.emptyText,
    required this.items,
  });

  final String title;
  final String emptyText;
  final List<PlannedSum> items;

  @override
  Widget build(final BuildContext context) {
    var total = 0.0;
    for (final item in items) {
      total += item.amount;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: context.textTheme.titleMedium)),
            Text('\$${total.toStringAsFixed(2)}'),
          ],
        ),
        const Gap(8),
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(emptyText, style: context.textTheme.bodyMedium),
          )
        else
          ...items.map((final item) => _PlannedSumTile(item: item)),
      ],
    );
  }
}

class _PlannedSumTile extends StatelessWidget {
  const _PlannedSumTile({required this.item});

  final PlannedSum item;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final strings = _PlannedStrings(locale);
    final controller = useTextEditingController(
      text: item.amount.toStringAsFixed(2),
    );

    Future<void> saveAmount() async {
      final amount = double.tryParse(controller.text.replaceAll(',', '.'));
      if (amount == null || amount < 0) return;
      await const UpsertPlannedSumCmd().execute((
        sum: PlannedSum(
          id: item.id,
          type: item.type,
          amount: amount,
          periodStart: item.periodStart,
          period: item.period,
        ),
      ));
    }

    return Card(
      child: ListTile(
        title: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(prefixText: r'$ '),
          onSubmitted: (_) => saveAmount(),
        ),
        subtitle: Text('${item.period.inDays} days'),
        trailing: IconButton(
          tooltip: strings.remove,
          onPressed: () =>
              unawaited(const RemovePlannedSumCmd().execute((id: item.id))),
          icon: const Icon(Icons.delete_outline_rounded),
        ),
      ),
    );
  }
}

class _UpsertPlannedSumSheet extends HookWidget {
  const _UpsertPlannedSumSheet();

  static Future<void> show(final BuildContext context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (final _) => const _UpsertPlannedSumSheet(),
  );

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final strings = _PlannedStrings(locale);
    final config = context.read<PredictionConfigResource>();
    final amountController = useTextEditingController();
    final type = useState(TransactionType.expense);

    void save() {
      final amount = double.tryParse(
        amountController.text.replaceAll(',', '.'),
      );
      if (amount == null || amount <= 0) return;
      unawaited(() async {
        await const UpsertPlannedSumCmd().execute((
          sum: PlannedSum.create(
            type: type.value,
            amount: amount,
            periodStart: config.selectedDate.toDayBeginning,
          ),
        ));
        if (context.mounted) Navigator.of(context).pop();
      }());
    }

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(strings.addTitle, style: context.textTheme.titleLarge),
          const Gap(16),
          TextField(
            controller: amountController,
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: r'$ ',
              labelText: strings.amountLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          UiSegmentedButton<TransactionType>(
            segments: [
              ButtonSegment(
                value: TransactionType.expense,
                label: Text(strings.expense),
              ),
              ButtonSegment(
                value: TransactionType.income,
                label: Text(strings.income),
              ),
            ],
            selected: type.value,
            onSelectionChanged: (final selected) => type.value = selected,
          ),
          const Gap(16),
          FilledButton(onPressed: save, child: Text(strings.save)),
        ],
      ),
    );
  }
}

class _PlannedStrings {
  const _PlannedStrings(this.locale);
  final Locale locale;

  String _get(final LocalizedMap map) => map.getValue(locale);

  String get title => _get(
    LocalizedMap({
      languages.en: 'Planned',
      languages.it: 'Pianificato',
      languages.ru: 'Запланировано',
    }),
  );

  String get expenses => _get(
    LocalizedMap({
      languages.en: 'Expenses',
      languages.it: 'Spese',
      languages.ru: 'Расходы',
    }),
  );

  String get incomes => _get(
    LocalizedMap({
      languages.en: 'Income',
      languages.it: 'Entrate',
      languages.ru: 'Доходы',
    }),
  );

  String get emptyExpenses => _get(
    LocalizedMap({
      languages.en: 'No planned expenses.',
      languages.it: 'Nessuna spesa pianificata.',
      languages.ru: 'Нет запланированных расходов.',
    }),
  );

  String get emptyIncomes => _get(
    LocalizedMap({
      languages.en: 'No planned income.',
      languages.it: 'Nessuna entrata pianificata.',
      languages.ru: 'Нет запланированного дохода.',
    }),
  );

  String get addTitle => _get(
    LocalizedMap({
      languages.en: 'Add planned amount',
      languages.it: 'Aggiungi importo pianificato',
      languages.ru: 'Добавить запланированную сумму',
    }),
  );

  String get amountLabel => _get(
    LocalizedMap({
      languages.en: 'Amount per period',
      languages.it: 'Importo per periodo',
      languages.ru: 'Сумма за период',
    }),
  );

  String get expense => _get(
    LocalizedMap({
      languages.en: 'Expense',
      languages.it: 'Spesa',
      languages.ru: 'Расход',
    }),
  );

  String get income => _get(
    LocalizedMap({
      languages.en: 'Income',
      languages.it: 'Entrata',
      languages.ru: 'Доход',
    }),
  );

  String get save => _get(
    LocalizedMap({
      languages.en: 'Save',
      languages.it: 'Salva',
      languages.ru: 'Сохранить',
    }),
  );

  String get remove => _get(
    LocalizedMap({
      languages.en: 'Remove',
      languages.it: 'Rimuovi',
      languages.ru: 'Удалить',
    }),
  );
}
