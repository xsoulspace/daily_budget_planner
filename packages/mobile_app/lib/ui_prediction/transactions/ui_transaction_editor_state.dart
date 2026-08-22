part of 'ui_transaction_editor.dart';

class _EditingController extends ValueNotifier<LoadableContainer<Transaction>>
    with HasNotifiers {
  _EditingController({
    required final Transaction transaction,
    required final TransactionSchedule schedule,
  })  : isEditing = transaction.isExists,
        _schedule = schedule,
        _canCompose = transaction.isExists,
        super(
          LoadableContainer(
            value: transaction,
            isLoaded: transaction.isExists,
          ),
        );
  bool get isNew => !isEditing;
  final bool isEditing;
  TransactionSchedule _schedule = TransactionSchedule.empty;
  TransactionSchedule get schedule => _schedule;
  set schedule(final TransactionSchedule value) {
    _schedule = value;
    notifyListeners();
  }

  late final _composedListenable = Listenable.merge([
    amount,
    coinPrice,
  ]);
  void onLoad({
    required final bool isTaxFree,
  }) {
    _composedListenable.addListener(notifyListeners);
    final rawAmount = transaction.input.amount(taxFree: isTaxFree);
    if (rawAmount > 0) amount.text = rawAmount.toString();
    // TODO(arenukvern): description
    // coinPrice.text = transaction?.input.coinPrice.toString() ?? '';
  }

  LoadableContainer<Transaction> get container => value;
  Transaction get transaction => container.value;
  bool get isLoaded => container.isLoaded;
  final amount = TextEditingController();
  final coinPrice = TextEditingController();

  @override
  void notifyListeners() {
    _verifyCompose();
    super.notifyListeners();
  }

  void _verifyCompose() {
    bool readyToCompose = false;
    switch (transaction.input.currencyType) {
      case CurrencyType.fiat:
        readyToCompose = jsonDecodeDouble(amount.text) > 0;
      case CurrencyType.crypto:
        readyToCompose = jsonDecodeDouble(amount.text) > 0 &&
            jsonDecodeDouble(coinPrice.text) > 0;
    }
    _canCompose = readyToCompose;
  }

  void setState(final Transaction Function(Transaction state) change) =>
      value = LoadableContainer(
        value: change(transaction),
        isLoaded: true,
      );

  void setMoney(final InputMoney Function(InputMoney state) change) =>
      setState((final state) => state.copyWith(input: change(state.input)));

  bool _canCompose = false;
  bool get canCompose => _canCompose;

  TransactionEditorResult? composeResult() {
    if (!canCompose) return null;
    final amount = jsonDecodeDouble(this.amount.text);
    // final coinPrice = jsonDecodeDouble(this.coinPrice.text);

    final resultTransaction = transaction.copyWith(
      id: isNew ? TransactionId.newId() : transaction.id,
      input: switch (transaction.input.currencyType) {
        CurrencyType.fiat => InputMoney.fiat(amountWithTax: amount),
        CurrencyType.crypto => InputMoney.crypto(
            amountWithTax: amount,
            // coinPrice: coinPrice,
          ),
      },
    );
    final scheduledTransaction = ScheduledTransaction(
      schedule: schedule.copyWith(
        startedAt: schedule.startedAt ?? resultTransaction.transactionDate,
      ),
      transactionId: resultTransaction.id,
      taskId: resultTransaction.taskId,
    );
    final result = (
      transaction: resultTransaction,
      scheduledTransaction: scheduledTransaction,
    );
    return result;
  }

  @override
  void dispose() {
    _composedListenable.removeListener(notifyListeners);
    amount.dispose();
    coinPrice.dispose();
    super.dispose();
  }
}
