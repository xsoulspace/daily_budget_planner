import 'package:mobile_app/common_imports.dart';

@resource
class TransactionsConfigResource with ChangeNotifier {
  // TODO(arenukvern): cache somewere else
  DateTime? _lastUpdatedTransactionDate;
  final tasksType = TaskType.personal;
}

extension TransactionsConfigResourceX on TransactionsConfigResource {
  DateTime? get lastUpdatedTransactionDate => _lastUpdatedTransactionDate;
  set lastUpdatedTransactionDate(final DateTime? value) =>
      setState(() => _lastUpdatedTransactionDate = value);
}
