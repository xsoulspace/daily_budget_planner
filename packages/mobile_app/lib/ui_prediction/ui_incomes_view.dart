import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';
import 'package:mobile_app/ui_prediction/ui_prediction.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class UiIncomesView extends StatelessWidget {
  const UiIncomesView({this.isRegular = false, super.key});
  final bool isRegular;
  static Future<void> show({
    required final BuildContext context,
    final bool isRegular = false,
  }) async {
    await Navigator.of(context).push(
      CupertinoModalSheetRoute(
        builder: (final _) => UiBottomSheetWrapper(
          child: UiIncomesView(isRegular: isRegular),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final incomes = context.select<UiPredictionNotifier, List<Transaction>>(
      (final state) => state.value.incomes,
    );

    return UiColumnScaffold(
      appBar: UiAppBar(
        titleText: isRegular ? 'Regular incomes' : 'Incomes',
        automaticallyImplyLeading: false,
        trailing: UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: IncomeTable(
            incomes: incomes,
            isRegular: isRegular,
          ),
        ),
        UiTransactionsActionsBar(
          tuple: (type: TransactionType.income,),
        ),
        Gap(8),
        UiSafeArea.bottom(),
      ],
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
      transaction.amount.toString(),
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
              ? a.amount.compareTo(b.amount)
              : b.amount.compareTo(a.amount);
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

typedef UiTransactionsActionsBarTuple = ({
  TransactionType type,
});

class UiTransactionsActionsBar extends StatelessWidget {
  const UiTransactionsActionsBar({required this.tuple, super.key});
  final UiTransactionsActionsBarTuple tuple;
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiBottomActionBar(
      children: [
        const UiBackButton(),
        UiTextButton(
          onPressed: () async => TransactionBottomSheet.show(
            context,
            type: tuple.type,
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Gap(4),
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Add ${tuple.type.name}',
                    languages.it: 'Aggiungi ${switch (tuple.type) {
                      TransactionType.income => 'entrate',
                      TransactionType.expense => 'spese',
                      TransactionType.transfer => 'transferenze',
                    }}',
                    languages.ru: 'Добавить ${tuple.type.name}',
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

class UiBottomActionBar extends StatelessWidget {
  const UiBottomActionBar({
    required this.children,
    this.margin,
    super.key,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(final BuildContext context) => SafeArea(
        top: false,
        child: Hero(
          tag: 'bottom-action-bar',
          child: UiBottomActionBarDecorator(
            margin: margin,
            children: children,
          ),
        ),
      );
}

class UiBottomActionBarDecorator extends StatelessWidget {
  const UiBottomActionBarDecorator({
    required this.children,
    this.margin,
    super.key,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: context.colorScheme.surface,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      );
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
