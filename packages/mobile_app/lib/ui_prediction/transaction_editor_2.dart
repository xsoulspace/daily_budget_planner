import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';

Future<Transaction?> showTransactionEditor(
  final BuildContext context, {
  required final Transaction? transaction,
}) =>
    Navigator.push(
      context,
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (final context) => _TransactionEditor(
          transaction: transaction,
        ),
      ),
    );

class _TransactionEditor extends StatefulHookWidget {
  const _TransactionEditor({required this.transaction});

  final Transaction? transaction;

  @override
  State<_TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<_TransactionEditor> {
  late final _EditingController controller = _EditingController(
    transaction: widget.transaction,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> onPopInvoked(final bool didPop) async {
    if (didPop) {
      // Already popped.
      return;
    } else if (!controller.canCompose) {
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
    useListenable(controller);
    final locale = useLocale(context);

    final body = SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Transaction type
          CupertinoSlidingSegmentedControl<TransactionType>(
            groupValue: controller.transactionType.value,
            children: {
              TransactionType.income: Text('Income'),
              TransactionType.expense: Text('Expense'),
              TransactionType.transfer: Text('Transfer'),
            },
            onValueChanged: (final value) {
              if (value != null) {
                controller.transactionType.value = value;
              }
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Builder(
              builder: (final context) {
                final label = LocalizedMap(
                  value: {
                    languages.en: 'Amount',
                    languages.it: 'Importo',
                    languages.ru: 'Сумма',
                  },
                ).getValue(locale);
                return UiTextField(
                  hintText: '0.00',
                  decoration: InputDecoration(
                    labelText: label,
                  ),
                  autofocus: true,
                  style: Theme.of(context).textTheme.titleLarge,
                  textInputAction: TextInputAction.next,
                  onChanged: (final value) => controller.amount.value = value,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (final value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Builder(
              builder: (final context) {
                final label = LocalizedMap(
                  value: {
                    languages.en: 'Coin price',
                    languages.it: 'Prezzo della moneta',
                    languages.ru: 'Цена монеты',
                  },
                ).getValue(locale);
                return UiTextField(
                  hintText: '0.00',
                  decoration: InputDecoration(
                    labelText: label,
                    // TODO(arenukvern): add coin symbol
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  autofocus: true,
                  style: Theme.of(context).textTheme.titleLarge,
                  textInputAction: TextInputAction.next,
                  onChanged: (final value) => controller.amount.value = value,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (final value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an price';
                    }
                    if (doubleNullableFromJson(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                );
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _DateTimePicker(controller),
                const SizedBox(width: 8),
                const SizedBox(width: 8),
                _Reminder(controller),
              ],
            ),
          ),
        ],
      ),
    );

    final bottomBar = StickyBottomBarVisibility(
      child: BottomAppBar(
        child: Row(
          children: [
            _FolderSelector(controller),
            const Spacer(),
          ],
        ),
      ),
    );

    const sheetShape = ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );

    return SafeArea(
      bottom: false,
      child: PopScope(
        canPop: false,
        onPopInvoked: onPopInvoked,
        child: SheetKeyboardDismissible(
          dismissBehavior: const SheetKeyboardDismissBehavior.onDragDown(
            isContentScrollAware: true,
          ),
          child: ScrollableSheet(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: sheetShape,
              child: SheetContentScaffold(
                resizeBehavior: const ResizeScaffoldBehavior.avoidBottomInset(
                  // Make the bottom bar visible when the keyboard is open.
                  maintainBottomBar: true,
                ),
                body: body,
                bottomBar: bottomBar,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker(this.controller);

  final _EditingController controller;

  @override
  Widget build(final BuildContext context) => ActionChip(
        avatar: const Icon(Icons.event),
        label: const Text('No date'),
        onPressed: () {},
      );
}

class _Reminder extends StatelessWidget {
  const _Reminder(this.controller);

  final _EditingController controller;

  @override
  Widget build(final BuildContext context) => ActionChip(
        avatar: const Icon(Icons.alarm),
        label: const Text('Reminder'),
        onPressed: () {},
      );
}

class _FolderSelector extends StatelessWidget {
  const _FolderSelector(this.controller);

  final _EditingController controller;

  @override
  Widget build(final BuildContext context) => TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.folder_outlined),
        label: const Row(
          children: [
            Text('Inbox'),
            SizedBox(width: 16),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      );
}

class _EditingController extends ChangeNotifier {
  _EditingController({
    required final Transaction? transaction,
  })  : _canCompose = transaction != null,
        transactionType =
            ValueNotifier(transaction?.type ?? TransactionType.income),
        date = ValueNotifier(transaction?.date ?? DateTime.now()),
        description = ValueNotifier(transaction?.description ?? ''),
        amount = ValueNotifier(transaction?.amount.toString() ?? '') {
    Listenable.merge([transactionType, description, date, amount])
        .addListener(_onChanged);
  }

  void _onChanged() {
    _canCompose = description.value.isNotEmpty;
    notifyListeners();
  }

  final ValueNotifier<TransactionType> transactionType;
  final ValueNotifier<String> description;
  final ValueNotifier<String> amount;
  final ValueNotifier<DateTime> date;
  bool _canCompose = false;
  bool get canCompose => _canCompose;
  @override
  void dispose() {
    transactionType.dispose();
    description.dispose();
    super.dispose();
  }

  Transaction compose() => Transaction(
        type: transactionType.value,
        description: description.value.trim(),
        date: date.value,
        amount: doubleFromJson(amount.value),
      );
}
