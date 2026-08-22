import 'package:mobile_app/common_imports.dart';

/// transactions without tasks
@resource
class IncomeTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {
  IncomeTransactionsResource()
    : super(toKey: (final transaction) => transaction.id);
}

/// transactions without tasks
@resource
class ExpenseTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {
  ExpenseTransactionsResource()
    : super(toKey: (final transaction) => transaction.id);
}

/// transactions without tasks
@resource
class TransferInTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {
  TransferInTransactionsResource()
    : super(toKey: (final transaction) => transaction.id);
}

/// transactions without tasks
@resource
class TransferOutTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {
  TransferOutTransactionsResource()
    : super(toKey: (final transaction) => transaction.id);
}
