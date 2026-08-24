import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_kit/molecules/ui_modal_sheet_route.dart';

/// Roadmap 1.5.3 "Committed surface": first-class view of recurring
/// commitments (subscriptions, credit payments, bills) with their total
/// effect on today's number.
Future<void> showCommittedView({required final BuildContext context}) =>
    Navigator.of(context, rootNavigator: true).push(
      UiModalSheetRoute<void>(
        builder: (final _) =>
            const UiBottomSheetWrapper(child: CommittedView()),
      ),
    );

class CommittedView extends StatelessWidget {
  const CommittedView({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final strings = _CommittedStrings(locale);
    final config = context.watch<PredictionConfigResource>();
    final range = DateTimeRange(start: config.startDate, end: config.endDate);
    final commitments = context.watch<CommitmentsResource>();
    final items = commitments.orderedValues;
    final total = items.totalForRange(range);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(title: Text(strings.title)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => _UpsertCommitmentSheet.show(context),
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  strings.committedThisPeriod,
                  style: context.textTheme.titleMedium,
                ),
                Text(
                  '-\$${total.toStringAsFixed(2)}',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: items.isEmpty
                ? Center(child: Text(strings.empty))
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (final context, final index) {
                      final commitment = items[index];
                      return ListTile(
                        leading: Icon(commitment.type.icon),
                        title: Text(
                          commitment.title.isEmpty
                              ? commitment.type.label(locale)
                              : commitment.title,
                        ),
                        subtitle: Text(
                          '${commitment.period.inDays}d · '
                          '-\$${commitment.totalForRange(range).toStringAsFixed(2)}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          tooltip: strings.remove,
                          onPressed: () => unawaited(
                            const RemoveCommitmentCmd().execute((
                              id: commitment.id,
                            )),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _UpsertCommitmentSheet extends HookWidget {
  const _UpsertCommitmentSheet();

  static Future<void> show(final BuildContext context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (final _) => const _UpsertCommitmentSheet(),
  );

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final strings = _CommittedStrings(locale);
    final titleController = useTextEditingController();
    final amountController = useTextEditingController();
    final period = useState(Period.monthly);

    void save() {
      final amount = double.tryParse(
        amountController.text.replaceAll(',', '.'),
      );
      if (amount == null || amount <= 0) return;
      unawaited(
        const UpsertCommitmentCmd().execute((
          commitment: Commitment.create(
            title: titleController.text.trim(),
            amount: amount,
            period: period.value,
          ),
        )),
      );
      Navigator.of(context).pop();
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
            controller: titleController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: strings.nameLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: r'$ ',
              labelText: strings.amountLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          UiSegmentedButton<int>(
            segments: const [Period.weekly, Period.monthly, Period.yearly]
                .map(
                  (final e) => ButtonSegment<int>(
                    value: e.inDays,
                    label: Text(e.inDays == 7 ? 'week' : e.inDays.toString()),
                  ),
                )
                .toList(),
            selected: period.value.inDays,
            onSelectionChanged: (final days) {
              period.value = switch (days) {
                7 => Period.weekly,
                30 => Period.monthly,
                _ => Period.yearly,
              };
            },
          ),
          const Gap(16),
          FilledButton(onPressed: save, child: Text(strings.save)),
        ],
      ),
    );
  }
}

class _CommittedStrings {
  const _CommittedStrings(this.locale);
  final Locale locale;

  String _get(final LocalizedMap map) => map.getValue(locale);

  String get title => _get(
    LocalizedMap({
      languages.en: 'Committed',
      languages.it: 'Impegni',
      languages.ru: 'Обязательства',
    }),
  );

  String get committedThisPeriod => _get(
    LocalizedMap({
      languages.en: 'This period',
      languages.it: 'Questo periodo',
      languages.ru: 'Этот период',
    }),
  );

  String get empty => _get(
    LocalizedMap({
      languages.en:
          'No commitments yet. Add subscriptions or bills to see their effect on your number.',
      languages.it:
          'Nessun impegno. Aggiungi abbonamenti o bollette per vedere il loro effetto.',
      languages.ru:
          'Пока нет обязательств. Добавьте подписки или счета, чтобы увидеть их влияние.',
    }),
  );

  String get addTitle => _get(
    LocalizedMap({
      languages.en: 'Add commitment',
      languages.it: 'Aggiungi impegno',
      languages.ru: 'Добавить обязательство',
    }),
  );

  String get nameLabel => _get(
    LocalizedMap({
      languages.en: 'Name (e.g. Netflix)',
      languages.it: 'Nome (es. Netflix)',
      languages.ru: 'Название (напр. Netflix)',
    }),
  );

  String get amountLabel => _get(
    LocalizedMap({
      languages.en: 'Amount per period',
      languages.it: 'Importo per periodo',
      languages.ru: 'Сумма за период',
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

extension on CommitmentType {
  IconData get icon => switch (this) {
    CommitmentType.subscription => Icons.subscriptions_rounded,
    CommitmentType.creditPayment => Icons.account_balance_rounded,
    CommitmentType.recurringBill => Icons.receipt_long_rounded,
    CommitmentType.other => Icons.repeat_rounded,
  };

  String label(final Locale locale) => LocalizedMap(switch (this) {
    CommitmentType.subscription => {
      languages.en: 'Subscription',
      languages.it: 'Abbonamento',
      languages.ru: 'Подписка',
    },
    CommitmentType.creditPayment => {
      languages.en: 'Credit payment',
      languages.it: 'Rata credito',
      languages.ru: 'Платёж по кредиту',
    },
    CommitmentType.recurringBill => {
      languages.en: 'Recurring bill',
      languages.it: 'Bolletta',
      languages.ru: 'Регулярный счёт',
    },
    CommitmentType.other => {
      languages.en: 'Other',
      languages.it: 'Altro',
      languages.ru: 'Другое',
    },
  }).getValue(locale);
}
