import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_kit/molecules/ui_modal_sheet_route.dart';
import 'package:mobile_app/ui_prediction/transactions/ui_transactions_actions_bar.dart';

class UiIncomesView extends StatelessWidget {
  const UiIncomesView({this.isRegular = false, super.key});
  final bool isRegular;
  static Future<void> show({
    required final BuildContext context,
    final bool isRegular = false,
  }) async => Navigator.of(context, rootNavigator: true).push(
    UiModalSheetRoute<void>(
      builder: (final _) =>
          UiBottomSheetWrapper(child: UiIncomesView(isRegular: isRegular)),
    ),
  );

  @override
  Widget build(final BuildContext context) {
    // TODO(arenukvern):  add pagination
    final incomes = <Transaction>[];
    //     context.select<TasksTransactionsResource, List<Transaction>>(
    //   (final state) => state.value.incomes,
    // );

    return UiColumnScaffold(
      appBar: UiAppBar(
        titleText: isRegular ? 'Regular incomes' : 'Incomes',
        automaticallyImplyLeading: false,
        trailing: const UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: IncomeTable(incomes: incomes, isRegular: isRegular),
        ),
        const UiTransactionsActionsBar(tuple: (type: TransactionType.income)),
        const Gap(8),
        const UiSafeArea.bottom(),
      ],
    );
  }
}

class IncomeTable extends HookWidget {
  const IncomeTable({
    required this.incomes,
    required this.isRegular,
    super.key,
  });

  final List<Transaction> incomes;
  final bool isRegular;

  @override
  Widget build(final BuildContext context) {
    final filteredIncomes = useMemoized(
      () => incomes
          .where(
            (final income) => income.isRegular == isRegular && income.isIncome,
          )
          .toList(),
      [incomes, isRegular],
    );

    return UiTransactionsTable<Transaction>(transactions: filteredIncomes);
  }
}
