import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';

class AddTaskTransactionButton extends StatelessWidget {
  const AddTaskTransactionButton({
    required this.currencyType,
    required this.dto,
    this.task = Task.empty,
    this.padding = const EdgeInsets.all(8),
    super.key,
  });
  final TransactionEditorDto dto;
  final Task task;
  final CurrencyType currencyType;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(final BuildContext context) {
    final transactionDate = useTaskTransactionSelectionDate(context);

    final defaultCurrencyId = useDefaultCurrencyId(
      context,
      currencyType: currencyType,
    );
    final locale = useLocale(context);
    return UiBaseButton(
      tooltip: LocalizedMap(
        // TODO(arenukvern): add localization l10n
        dto.isUsedForTaskPlanning
            ? {
                languages.en: 'Plan transaction',
                languages.it: 'Pianifica transazione',
                languages.ru: 'Запланировать транзакцию',
              }
            : {
                languages.en: 'Add transaction',
                languages.it: 'Aggiungi transazione',
                languages.ru: 'Добавить транзакцию',
              },
      ).getValue(locale),
      onPressed: () async {
        final result = await showTransactionEditor(
          context,
          transaction: Transaction.create(
            taskId: task.id,
            transactionDate: transactionDate,
            type: task.transactionType.toTransactionType(),
            currencyType: currencyType,
            currencyId: defaultCurrencyId,
          ),
          dto: dto,
        );
        if (result == null) return;

        unawaited(
          const UpsertTransactionCommand().execute(
            result: result,
            taskId: task.id,
          ),
        );
      },
      builder: (final context, final focused, final onlyFocused) =>
          UiFocusedBox(
            focused: focused,
            child: Padding(
              padding: padding,
              child: Icon(
                Icons.add,
                color: focused
                    ? null
                    : context.colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ),
    );
  }
}
