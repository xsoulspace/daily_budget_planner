import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_kit/molecules/ui_modal_sheet_route.dart';
import 'package:mobile_app/ui_prediction/transaction_editor_fields/transaction_editor_fields.dart';

part 'ui_transaction_editor_state.dart';

@immutable
class TransactionEditorDto {
  const TransactionEditorDto({
    this.isTypeChangable = false,
    this.isTaskChoosable = false,
    this.isUsedForTaskPlanning = false,
    this.isPeriodChangable = false,
    this.isCurrencyChoosable = Envs.isCryptoEnabled,
  });
  final bool isTypeChangable;
  final bool isTaskChoosable;
  final bool isUsedForTaskPlanning;
  final bool isPeriodChangable;
  final bool isCurrencyChoosable;
  static const empty = TransactionEditorDto();
}

Map<TransactionType, String> getTransactionTypeNames({
  required final CurrencyType currencyType,
  required final Locale locale,
}) => {
  ...switch (currencyType) {
    CurrencyType.fiat => {
      TransactionType.income: 'Income',
      TransactionType.expense: 'Expense',
    },
    CurrencyType.crypto => {
      TransactionType.income: 'Buy',
      TransactionType.expense: 'Sell',
    },
  },
  TransactionType.transferIn: 'Transfer in',
  TransactionType.transferOut: 'Transfer out',
};

typedef TransactionEditorResult = ({
  Transaction transaction,
  ScheduledTransaction scheduledTransaction,
});

Future<TransactionEditorResult?> showTransactionEditor(
  final BuildContext context, {
  required final Transaction transaction,
  final TransactionSchedule schedule = TransactionSchedule.empty,
  final TransactionEditorDto dto = TransactionEditorDto.empty,
}) => Navigator.of(context, rootNavigator: true).push(
  UiModalSheetRoute<TransactionEditorResult>(
    builder: (final context) => _TransactionEditor(
      transaction: transaction,
      schedule: schedule,
      dto: dto,
    ),
  ),
);

class _TransactionEditor extends StatefulHookWidget {
  const _TransactionEditor({
    required this.transaction,
    required this.schedule,
    required this.dto,
  });

  final Transaction transaction;
  final TransactionSchedule schedule;
  final TransactionEditorDto dto;
  @override
  State<_TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<_TransactionEditor>
    with HasNotifiers {
  late final _EditingController controller = _EditingController(
    transaction: widget.transaction,
    schedule: widget.schedule,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> onPopInvoked() async {
    if (!controller.canCompose) {
      // Dismiss immediately if there are no unsaved changes.
      Navigator.pop(context);
      return;
    }

    // Show a confirmation dialog.
    final shouldPop = await showDialog(
      context: context,
      builder: (final context) => AlertDialog(
        title: const Text('Discard changes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Discard'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );

    if (shouldPop == true && mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final dto = widget.dto;
    useListenable(controller);
    final locale = useLocale(context);
    final transaction = controller.transaction;
    final isNew = controller.isNew;
    final currencyType = transaction.input.currencyType;
    final transactionTypeNames = getTransactionTypeNames(
      currencyType: currencyType,
      locale: locale,
    );
    final amountField = TransactionAmountField(
      controller: controller.amount,
      currencyType: currencyType,
      currencyId: transaction.input.currencyId,
    );

    final nameField = TransactionNameField(
      name: transaction.description,
      onChanged: (final value) => controller.setState(
        (final state) => state.copyWith(description: value),
      ),
    );
    final noteField = TransactionNoteField(
      note: transaction.note,
      onChanged: (final value) =>
          controller.setState((final state) => state.copyWith(note: value)),
    );

    const padding = EdgeInsets.symmetric(horizontal: 16);

    final taskTransactionType = transaction.type.toTaskTransactionType();

    final body = SingleChildScrollView(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: UiAppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    // TODO(arenukvern): add localization l10n
                    '${dto.isUsedForTaskPlanning ? '${isNew ? 'Plan' : 'Edit planned'} ' : '${isNew ? 'Add' : 'Edit'} '}'
                    '${transactionTypeNames[transaction.type]!}',
                  ),
                  trailing: const UiTextActionButton.cancel(),
                ),
              ),
            ],
          ),
          if (taskTransactionType != null) ...[
            Padding(
              padding: padding,
              child: TaskIdField(
                readonly: !dto.isTaskChoosable,
                transactionType: taskTransactionType,
                taskId: transaction.taskId,
                onChanged: (final value) => controller.setState(
                  (final state) => state.copyWith(taskId: value),
                ),
              ),
            ),
          ],
          if (dto.isCurrencyChoosable) ...[
            CurrencyTypeField(
              currencyType: currencyType,
              onChanged: (final value) => controller.setMoney(
                (final state) => state.copyWith(currencyType: value),
              ),
            ),
          ],
          if (dto.isTypeChangable) ...[
            TransactionTypeField(
              currencyType: currencyType,
              value: transaction.type,
              onChanged: (final value) => controller.setState(
                (final state) => state.copyWith(type: value),
              ),
            ),
          ],

          if (Envs.isCurrencySwitchingEnabled) ...[
            Padding(
              padding: padding,
              child: CurrencyAutoCompleter(
                onSelected: (final selection) => controller.setMoney(
                  (final state) => state.copyWith(
                    currencyId: selection,
                    currencyType: dictionariesNotifier
                        .getCurrency(selection, currencyType)
                        .type,
                  ),
                ),
                type: currencyType,
              ),
            ),
          ],
          if (currencyType case CurrencyType.fiat) ...[nameField],

          /// there is two cases:
          /// when it's crypto:
          /// - sum should be calculated in Quantity * Coin price
          ///
          /// when it's fiat:
          /// - sum is just amount
          // TODO(arenukvern): add crypto amount
          ...switch (transaction.input.currencyType) {
            CurrencyType.fiat => [amountField],
            CurrencyType.crypto => [
              amountField,
              Padding(
                padding: padding,
                child: CoinPriceField(controller: controller.coinPrice),
              ),
            ],
          },
          if (currencyType case CurrencyType.crypto) noteField,
          if (dto.isPeriodChangable) ...[
            Center(
              child: SchedulePeriodSwitcher(
                value: controller.schedule.period,
                onValueChanged: (final period) => controller.schedule =
                    controller.schedule.copyWith(period: period),
              ),
            ),
          ],
          Padding(
            padding: padding,
            child: DatetimeField(
              date: transaction.transactionDate,
              onChanged: (final value) => controller.setState(
                (final state) => state.copyWith(transactionDate: value),
              ),
            ),
          ),
          const Gap(8),
        ],
      ),
    );

    return UiBottomSheetScaffold(
      body: body,
      bottomBar: UiBottomActionBar(
        children: [
          Expanded(
            child: UiTextButton(
              expands: true,
              onPressed: () {
                final transaction = controller.composeResult();
                if (transaction != null) {
                  Navigator.pop(context, transaction);
                }
              },
              title: Text(
                '${isNew ? 'Add' : 'Edit'} '
                '${transactionTypeNames[transaction.type]!}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      onPopInvoked: onPopInvoked,
    );
  }
}
