import 'package:mobile_app/common_imports.dart';

typedef UiTasksActionsBarTuple =
    ({
      TaskTransactionType taskTransactionType,
      CurrencyType currencyType,
      Task task,
    });

DateTime useSelectionDate(final BuildContext context) =>
    context.select<PredictionConfigResource, DateTime>(
      (final state) => state.selectedDate,
    );

DateTime useTaskTransactionSelectionDate(final BuildContext context) {
  final selectedDate = useSelectionDate(context);
  final lastUpdatedTransactionDate = context
      .select<TransactionsConfigResource, DateTime?>(
        (final state) => state.lastUpdatedTransactionDate,
      );
  return lastUpdatedTransactionDate ?? selectedDate;
}

class UiTasksActionsBar extends StatelessWidget with HasNotifiers {
  const UiTasksActionsBar({required this.tuple, super.key});
  final UiTasksActionsBarTuple tuple;
  @override
  Widget build(final BuildContext context) {
    final defaultCurrencyId = useDefaultCurrencyId(
      context,
      currencyType: tuple.currencyType,
    );
    final transactionDate = useTaskTransactionSelectionDate(context);

    final locale = useLocale(context);
    return UiBottomActionBar(
      children: [
        const UiBackButton(),
        UiTextButton(
          onPressed: () async {
            final result = await showTransactionEditor(
              context,
              transaction: Transaction.create(
                type: tuple.taskTransactionType.toTransactionType(),
                currencyType: tuple.currencyType,
                currencyId: defaultCurrencyId,
                taskId: tuple.task.id,
                transactionDate: transactionDate,
              ),
              dto: const TransactionEditorDto(
                isUsedForTaskPlanning: true,
                isTaskChoosable: true,
                isPeriodChangable: true,
              ),
            );
            if (result == null) return;
            unawaited(
              const UpsertTransactionCommand().execute(
                result: result,
                taskId: tuple.task.id,
              ),
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
                    languages.en: 'Add ${tuple.taskTransactionType.name}',
                    languages.it:
                        'Aggiungi ${switch (tuple.taskTransactionType) {
                          TaskTransactionType.income => 'entrate',
                          TaskTransactionType.expense => 'spese',
                        }}',
                    languages.ru:
                        'Добавить ${switch (tuple.taskTransactionType) {
                          TaskTransactionType.income => 'доход',
                          TaskTransactionType.expense => 'расход',
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
