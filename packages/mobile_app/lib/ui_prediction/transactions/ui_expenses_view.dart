import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_kit/molecules/ui_modal_sheet_route.dart';
import 'package:mobile_app/ui_prediction/transactions/ui_transactions_actions_bar.dart';

class UiExpensesView extends StatelessWidget {
  const UiExpensesView({this.isRegular = false, super.key});
  final bool isRegular;
  static Future<void> show({
    required final BuildContext context,
    final bool isRegular = false,
  }) async => Navigator.of(context, rootNavigator: true).push(
    UiModalSheetRoute<void>(
      builder: (final _) =>
          UiBottomSheetWrapper(child: UiExpensesView(isRegular: isRegular)),
    ),
  );

  @override
  Widget build(final BuildContext context) {
    // TODO(arenukvern):  add pagination
    final expenses = <Transaction>[];
    // context.select<TasksTransactionsResource, List<Transaction>>(
    //   (final state) => state.value.expenses,
    // );

    return UiColumnScaffold(
      appBar: UiAppBar(
        titleText: isRegular ? 'Regular expenses' : 'Expenses',
        automaticallyImplyLeading: false,
        trailing: const UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: ExpenseTable(expenses: expenses, isRegular: isRegular),
        ),
        const UiTransactionsActionsBar(tuple: (type: TransactionType.expense)),
        const Gap(8),
        const UiSafeArea.bottom(),
      ],
    );
  }
}

class ExpenseTable extends HookWidget {
  const ExpenseTable({
    required this.expenses,
    required this.isRegular,
    super.key,
  });

  final List<Transaction> expenses;
  final bool isRegular;

  @override
  Widget build(final BuildContext context) {
    final filteredExpenses = useMemoized(
      () => expenses
          .where(
            (final expense) =>
                expense.isRegular == isRegular && expense.isExpense,
          )
          .toList(),
      [expenses, isRegular],
    );

    return UiTransactionsTable<Transaction>(transactions: filteredExpenses);
  }
}
