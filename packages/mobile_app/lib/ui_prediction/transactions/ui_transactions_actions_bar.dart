import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';

typedef UiTransactionsActionsBarTuple = ({TransactionType type});

class UiTransactionsActionsBar extends StatelessWidget {
  const UiTransactionsActionsBar({required this.tuple, super.key});
  final UiTransactionsActionsBarTuple tuple;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final defaultCurrencyId = context
        .read<FinSettingsNotifier>()
        .getDefaultCurrencyId(Envs.kDefaultCurrencyType);
    final transactionDate = useSelectionDate(context);

    return UiBottomActionBar(
      children: [
        const UiBackButton(),
        UiTextButton(
          onPressed: () async {
            final transaction = await showTransactionEditor(
              context,
              transaction: Transaction.create(
                type: tuple.type,
                currencyType: Envs.kDefaultCurrencyType,
                currencyId: defaultCurrencyId,
                taskId: TaskId.empty,
                transactionDate: transactionDate,
              ),
            );
            if (transaction == null) return;
            unawaited(
              const UpsertTransactionCommand().execute(result: transaction),
            );
          },
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.add),
              const Gap(4),
              Text(
                LocalizedMap(
        {
                    languages.en: 'Add ${tuple.type.name}',
                    languages.it:
                        'Aggiungi ${switch (tuple.type) {
                          TransactionType.income => 'entrate',
                          TransactionType.expense => 'spese',
                          TransactionType.transferIn => 'transferenze in',
                          TransactionType.transferOut => 'transferenze out',
                        }}',
                    languages.ru:
                        'Добавить ${switch (tuple.type) {
                          TransactionType.income => 'доход',
                          TransactionType.expense => 'расход',
                          TransactionType.transferIn => 'входящий перевод',
                          TransactionType.transferOut => 'исходящий перевод',
                        }}',
                  },
                ).getValue(locale),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
