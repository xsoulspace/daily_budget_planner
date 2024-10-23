import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';
import 'package:mobile_app/ui_prediction/transaction_editor.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_notifier.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class UiIncomesView extends StatelessWidget {
  const UiIncomesView({this.isRegular = false, super.key});
  final bool isRegular;
  static Future<void> show({
    required final BuildContext context,
    final bool isRegular = false,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (final _) => UiIncomesView(isRegular: isRegular),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final incomes = context.select<UiPredictionNotifier, List<Transaction>>(
      (final state) => state.value.incomes,
    );
    final locale = useLocale(context);

    return UiScaffold(
      appBar: AppBar(
        title: Text(
          isRegular ? 'Regular incomes' : 'Incomes',
        ),
      ),
      floatingActionButton: UiTextButton(
        onPressed: () async =>
            TransactionBottomSheet.show(context, type: TransactionType.income),
        textTitle: LocalizedMap(
          value: {
            languages.en: 'Add income',
            languages.it: 'Aggiungi entrate',
            languages.ru: 'Добавить доход',
          },
        ).getValue(locale),
      ),
      body: IncomeTable(
        incomes: incomes,
        isRegular: isRegular,
      ),
    );
  }
}

class UiTransactionsTable<T extends Transaction> extends HookWidget {
  const UiTransactionsTable({
    required this.transactions,
    super.key,
  });

  final List<T> transactions;

  @override
  Widget build(final BuildContext context) {
    final sortColumn = useState('date');
    final ascending = useState(true);
    final filteredTransactions = useState([...transactions]);

    useEffect(
      () {
        filteredTransactions.value = [...transactions];
        _sortData(filteredTransactions, sortColumn.value, ascending.value);
        return null;
      },
      [transactions, sortColumn.value, ascending.value],
    );

    return TableView.builder(
      columnCount: 3,
      rowCount: filteredTransactions.value.length + 1,
      columnBuilder: (final columnIndex) {
        switch (columnIndex) {
          case 0:
            return TableSpan(
              extent: const FixedTableSpanExtent(150),
            );
          default:
            return const TableSpan(
              extent: FixedTableSpanExtent(80),
            );
        }
      },
      pinnedRowCount: 1,
      rowBuilder: (final rowIndex) => const TableSpan(
        extent: FixedTableSpanExtent(50),
      ),
      cellBuilder: (final context, final vicinity) {
        if (vicinity.row == 0) {
          return TableViewCell(
            child: _buildHeaderCell(
              context,
              vicinity.column,
              sortColumn,
              ascending,
            ),
          );
        }
        return TableViewCell(
          child: _buildDataCell(
            context,
            vicinity.column,
            filteredTransactions.value[vicinity.row - 1],
          ),
        );
      },
    );
  }

  Widget _buildHeaderCell(
    final BuildContext context,
    final int columnIndex,
    final ValueNotifier<String> sortColumn,
    final ValueNotifier<bool> ascending,
  ) {
    final headers = ['Date', 'Value', 'Currency'];
    final columnNames = ['date', 'value', 'currency'];

    return GestureDetector(
      onTap: () => _onSort(columnNames[columnIndex], sortColumn, ascending),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(headers[columnIndex]),
            if (sortColumn.value == columnNames[columnIndex])
              Icon(
                ascending.value ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCell(
    final BuildContext context,
    final int columnIndex,
    final T transaction,
  ) {
    final cellData = [
      DateFormat.yMMMEd().add_Hms().format(transaction.date),
      transaction.value.toString(),
      transaction.currency.value,
    ];

    return Container(
      alignment: Alignment.center,
      child: Text(cellData[columnIndex]),
    );
  }

  void _onSort(
    final String column,
    final ValueNotifier<String> sortColumn,
    final ValueNotifier<bool> ascending,
  ) {
    if (sortColumn.value == column) {
      ascending.value = !ascending.value;
    } else {
      sortColumn.value = column;
      ascending.value = true;
    }
  }

  void _sortData(
    final ValueNotifier<List<T>> filteredTransactions,
    final String sortColumn,
    final bool ascending,
  ) {
    filteredTransactions.value.sort((final a, final b) {
      switch (sortColumn) {
        case 'date':
          return ascending
              ? a.date.compareTo(b.date)
              : b.date.compareTo(a.date);
        case 'value':
          return ascending
              ? a.value.compareTo(b.value)
              : b.value.compareTo(a.value);
        case 'currency':
          return ascending
              ? a.currency.value.compareTo(b.currency.value)
              : b.currency.value.compareTo(a.currency.value);
        default:
          return 0;
      }
    });
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
