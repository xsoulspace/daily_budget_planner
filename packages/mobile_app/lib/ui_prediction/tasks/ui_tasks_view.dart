// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';

const _kItemExtent = 48.0;

class UiTasksBarView extends StatefulWidget {
  const UiTasksBarView({
    required this.tasks,
    required this.onSelect,
    required this.taskTransactionType,
    super.key,
  });
  final TaskTransactionType taskTransactionType;
  final List<Task> tasks;
  final void Function(int index) onSelect;

  @override
  State<UiTasksBarView> createState() => _UiTasksBarViewState();
}

class _UiTasksBarViewState extends State<UiTasksBarView> {
  final _scrollController = FixedExtentScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final tasks = widget.tasks;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 220),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: UiTipCard(
              text: LocalizedMap(
        switch (widget.taskTransactionType) {
                  TaskTransactionType.income => {
                    languages.en:
                        'Use categories to plan your regular incomes, '
                        'for example, salary, cashback etc. ',
                    languages.ru:
                        'Используйте категории для планирования регулярных доходов, '
                        ' например, зарплата, кэшбэк и т.д. ',
                    languages.it:
                        'Usa le categorie per pianificare le tue entrate periodiche, '
                        'come il salario, il caffè, ecc. ',
                  },
                  TaskTransactionType.expense => {
                    languages.en:
                        'Use categories to plan your regular expenses which '
                        'are usually huge, for example, rent, train, insurance, etc. ',
                    languages.ru:
                        'Используйте категории для планирования регулярных расходов, '
                        'которые обычно значительны, например, аренда, поездки на работу, '
                        'страхование и т.д. ',
                    languages.it:
                        'Usa le categorie per pianificare le tue spese periodiche, '
                        "che di solito sono grandi, come l'affitto, il treno, l'assicurazione, ecc. ",
                  },
                },
              ),
            ),
          ),
          SizedBox(
            height: 216.clamp(height * 0.6, height * 0.8).toDouble(),
            child: CupertinoPicker(
              itemExtent: _kItemExtent,
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              scrollController: _scrollController,
              onSelectedItemChanged: (final index) => widget.onSelect(index),
              children: [
                ...tasks.mapIndexed(
                  (final index, final task) => UiBaseButton(
                    pressedScale: 1,
                    onPressed:
                        () async => _scrollController.animateToItem(
                          index,
                          duration: 200.milliseconds,
                          curve: Curves.easeInOut,
                        ),
                    builder:
                        (final context, final focused, final onlyFocused) =>
                            Center(
                              child: Text(
                                task.title,
                                textAlign: TextAlign.center,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UiTipCard extends StatelessWidget {
  const UiTipCard({required this.text, super.key});
  final LocalizedMap text;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: UiBorderRadius.medium,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(child: Icon(Icons.tips_and_updates)),
            const TextSpan(text: ' '),
            TextSpan(text: text.getValue(locale)),
          ],
        ),
      ),
    );
  }
}

class UiTaskVerticalActionsBar extends StatelessWidget {
  const UiTaskVerticalActionsBar({
    required this.task,
    required this.isUsedForTaskPlanning,
    required this.currencyType,
    super.key,
  });
  final Task task;
  final bool isUsedForTaskPlanning;
  final CurrencyType currencyType;

  @override
  Widget build(final BuildContext context) => Center(
    child: Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: UiBorderRadius.medium,
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            AddTaskTransactionButton(
              padding: const EdgeInsets.all(3),
              task: task,
              dto: TransactionEditorDto(
                isPeriodChangable: true,
                isUsedForTaskPlanning: isUsedForTaskPlanning,
              ),
              currencyType: currencyType,
            ),
          ],
        ),
      ),
    ),
  );
}

class UiTaskView extends StatelessWidget with HasNotifiers {
  const UiTaskView({required this.currencyType, required this.task, super.key});
  final CurrencyType currencyType;
  final Task task;
  @override
  Widget build(final BuildContext context) {
    final (:transactions, :scheduledTransactions) = context
        .select<TaskTransactionsResource, UiTransactionsSchedulesRecord>(
          (final c) => c.getTransactionsByTaskId(task.id),
        );
    Future<void> onRemove(final Transaction transaction) async =>
        const RemoveTransactionCommand().execute(
          transactionId: transaction.id,
          taskId: task.id,
        );
    return CupertinoListSection(
      backgroundColor: Colors.transparent,
      header: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  task.title,
                  style: context.textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Builder(
              builder: (final context) {
                final selectedDate = useSelectionDate(context);
                final sumPerYear = scheduledTransactions.sumForPeriod(
                  allTransactions: transactions,
                  startAt: selectedDate,
                  period: Period.yearly,
                );
                final sumPerMonth = scheduledTransactions.sumForPeriod(
                  allTransactions: transactions,
                  startAt: selectedDate,
                  period: Period.monthly,
                );
                return Wrap(
                  children: [
                    // TODO(arenukvern): add selected date changer
                    Text(
                      'From ${selectedDate.isToday ? 'Today' : DateFormat('yyyy-MM-dd').format(selectedDate)}: ',
                    ),
                    // TODO(arenukvern): add localization l10n
                    Text('${sumPerYear.toStringAsFixed(2)} yearly • '),
                    Text('${sumPerMonth.toStringAsFixed(2)} monthly'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(color: context.colorScheme.primaryContainer),
      // TODO(arenukvern): convert to listview.builder
      children: [
        ...scheduledTransactions.map((final schedule) {
          final transaction = transactions[schedule.transactionId];
          if (transaction == null) return const SizedBox.shrink();
          return _UiTransactionCard(
            transaction: transaction,
            onRemove: onRemove,
            key: ValueKey(schedule.transactionId),
          );
        }),
      ],
    );
  }
}

class _UiTransactionCard extends StatelessWidget {
  const _UiTransactionCard({
    required this.transaction,
    required this.onRemove,
    super.key,
  });
  final Transaction transaction;
  final ValueChanged<Transaction> onRemove;

  @override
  Widget build(final BuildContext context) {
    final isTaxFree = context.select<PredictionConfigResource, bool>(
      (final c) => c.isTaxFree,
    );
    return CupertinoListTile(
      leading: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '${transaction.input.amount(taxFree: isTaxFree).toStringAsFixed(2)} '
          // TODO(arenukvern): show only currency different from default
          '${transaction.input.currencyId.toJson()}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(transaction.description),
      leadingSize: 48,
      additionalInfo: Text(
        DateFormat('yyyy-MM-dd').format(transaction.transactionDate),
        style: context.textTheme.bodySmall,
      ),
      trailing: UiBaseButton(
        onPressed: () => onRemove(transaction),
        builder:
            (final context, final focused, final onlyFocused) => Icon(
              Icons.remove,
              color:
                  focused
                      ? null
                      : context.colorScheme.onSurface.withOpacity(0.5),
            ),
      ),
    );
  }
}
