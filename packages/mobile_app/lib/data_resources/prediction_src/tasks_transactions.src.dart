import 'package:mobile_app/common_imports.dart';

@resource
class TaskTransactionsResource with ChangeNotifier {
  TaskTransactionsResource();
  var _transactions = <TransactionId, Transaction>{}.unmodifiable;
  var _tasksTransactions = <TaskId, List<ScheduledTransaction>>{}.unmodifiable;
}

extension TaskTransactionsResourceX on TaskTransactionsResource {
  UiTransactionsSchedulesRecord getTransactionsByTaskId(final TaskId taskId) {
    final scheduledTransactions = _tasksTransactions[taskId] ?? [];
    final transactions = <TransactionId, Transaction>{};
    for (final e in scheduledTransactions) {
      final transaction = _transactions[e.transactionId];
      if (transaction == null) continue;
      transactions[e.transactionId] = transaction;
    }
    return (
      transactions: transactions,
      scheduledTransactions: scheduledTransactions,
    );
  }

  void removeTransaction({
    required final TransactionId transactionId,
    required final TaskId taskId,
  }) {
    final updatedTransactions = {..._transactions}..remove(transactionId);
    _transactions = updatedTransactions.unmodifiable;
    if (taskId.isEmpty) return;
    final updatedTasksTransactions = {
      ..._tasksTransactions,
      taskId: [
        ...?_tasksTransactions[taskId]?.where(
          (final element) => element.transactionId != transactionId,
        ),
      ],
    };
    _tasksTransactions = updatedTasksTransactions.unmodifiable;
    setState(() {});
  }

  void upsertTransaction({
    required final Transaction transaction,
    required final ScheduledTransaction scheduledTransaction,
  }) {
    final taskId = scheduledTransaction.taskId;
    assert(taskId.isNotEmpty, 'TaskId is empty');
    _transactions = {
      ..._transactions,
      transaction.id: transaction,
    }.unmodifiable;
    final updatedTasksTransactions = {
      ..._tasksTransactions,
      taskId: [...?_tasksTransactions[taskId], scheduledTransaction],
    }.unmodifiable;
    _tasksTransactions = updatedTasksTransactions.unmodifiable;
    setState(() {});
  }

  void setTaskTransactions({
    required final TaskId taskId,
    required final List<ScheduledTransaction> scheduledTransactions,
    required final List<Transaction> transactions,
  }) {
    _tasksTransactions = {
      ..._tasksTransactions,
      taskId: scheduledTransactions,
    }.unmodifiable;
    _transactions = {
      ..._transactions,
      ...transactions.toMap(
        toKey: (final transaction) => transaction.id,
        toValue: (final transaction) => transaction,
      ),
    }.unmodifiable;
    setState(() {});
  }

  Transaction? getTransaction(final TransactionId transactionId) =>
      _transactions[transactionId];
}
