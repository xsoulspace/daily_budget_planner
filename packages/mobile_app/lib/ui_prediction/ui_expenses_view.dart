import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';
import 'package:mobile_app/ui_prediction/ui_incomes_view.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_notifier.dart';

class UiExpensesView extends StatelessWidget {
  const UiExpensesView({this.isRegular = false, super.key});
  final bool isRegular;
  static Future<void> show({
    required final BuildContext context,
    final bool isRegular = false,
  }) async =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (final _) => UiExpensesView(isRegular: isRegular),
        ),
      );

  @override
  Widget build(final BuildContext context) {
    final expenses = context.select<UiPredictionNotifier, List<Transaction>>(
      (final state) => state.value.expenses,
    );

    return UiColumnScaffold(
      appBar: AppBar(
        title: Text(
          isRegular ? 'Regular expenses' : 'Expenses',
        ),
      ),
      children: [
        UiTransactionsActionsBar(
          tuple: (type: TransactionType.expense,),
        ),
        Expanded(
          child: ExpenseTable(
            expenses: expenses,
            isRegular: isRegular,
          ),
        ),
      ],
    );
  }
}
