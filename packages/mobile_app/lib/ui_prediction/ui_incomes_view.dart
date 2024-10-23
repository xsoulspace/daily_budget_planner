import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_notifier.dart';

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
    final incomes = context.select<UiPredictionNotifier, List<Income>>(
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
        onPressed: () async {},
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

class UiTransactionsTable<T extends Transaction> extends StatefulWidget {
  const UiTransactionsTable({
    required this.transactions,
    super.key,
  });

  final List<T> transactions;

  @override
  State<UiTransactionsTable<T>> createState() => _UiTransactionsTableState<T>();
}

class _UiTransactionsTableState<T extends Transaction>
    extends State<UiTransactionsTable<T>> {
  String _sortColumn = 'date';
  bool _ascending = true;
  late List<T> _filteredTransactions;

  @override
  void initState() {
    super.initState();
    _filteredTransactions = widget.transactions;
    _sortData();
  }

  void _sortData() {
    _filteredTransactions.sort((final a, final b) {
      switch (_sortColumn) {
        case 'date':
          return _ascending
              ? a.date.compareTo(b.date)
              : b.date.compareTo(a.date);
        case 'value':
          return _ascending
              ? a.value.compareTo(b.value)
              : b.value.compareTo(a.value);
        case 'currency':
          return _ascending
              ? a.currency.value.compareTo(b.currency.value)
              : b.currency.value.compareTo(a.currency.value);
        default:
          return 0;
      }
    });
  }

  void _onSort(final String column) {
    setState(() {
      if (_sortColumn == column) {
        _ascending = !_ascending;
      } else {
        _sortColumn = column;
        _ascending = true;
      }
      _sortData();
    });
  }

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(
                label: GestureDetector(
                  onTap: () => _onSort('date'),
                  child: Row(
                    children: [
                      const Text('Date'),
                      if (_sortColumn == 'date')
                        Icon(
                          _ascending
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                        ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                label: GestureDetector(
                  onTap: () => _onSort('value'),
                  child: Row(
                    children: [
                      const Text('Value'),
                      if (_sortColumn == 'value')
                        Icon(
                          _ascending
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                        ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                label: GestureDetector(
                  onTap: () => _onSort('currency'),
                  child: Row(
                    children: [
                      const Text('Currency'),
                      if (_sortColumn == 'currency')
                        Icon(
                          _ascending
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                        ),
                    ],
                  ),
                ),
              ),
            ],
            rows: _filteredTransactions
                .map(
                  (final transaction) => DataRow(
                    cells: [
                      DataCell(Text(DateFormat.yMd().format(transaction.date))),
                      DataCell(Text(transaction.value.toString())),
                      DataCell(Text(transaction.currency.value)),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      );
}

class IncomeTable extends StatelessWidget {
  const IncomeTable({
    required this.incomes,
    required this.isRegular,
    super.key,
  });

  final List<Income> incomes;
  final bool isRegular;

  @override
  Widget build(final BuildContext context) {
    final filteredIncomes =
        incomes.where((final income) => income.isRegular == isRegular).toList();

    return UiTransactionsTable<Income>(transactions: filteredIncomes);
  }
}

class ExpenseTable extends StatelessWidget {
  const ExpenseTable({
    required this.expenses,
    required this.isRegular,
    super.key,
  });

  final List<Expense> expenses;
  final bool isRegular;

  @override
  Widget build(final BuildContext context) {
    final filteredExpenses = expenses
        .where((final expense) => expense.isRegular == isRegular)
        .toList();

    return UiTransactionsTable<Expense>(transactions: filteredExpenses);
  }
}
