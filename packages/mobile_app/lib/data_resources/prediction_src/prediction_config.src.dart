import 'package:mobile_app/common_imports.dart';

@resource
class PredictionConfigResource extends ChangeNotifier {
  bool _isTaxFree = Envs.isAmountsTaxFree;
  var _countWithTransfers = false;
  TaskType _taskType = TaskType.personal;
  Period _period = Period.monthly;
  var _selectedDate = DateTime.now();
}

extension PredictionConfigResourceX on PredictionConfigResource {
  DateTime get selectedDate => _selectedDate;
  set selectedDate(final DateTime v) => setState(() => _selectedDate = v);
  DateTime get startDate => selectedDate.toDayBeginning;
  DateTime get endDate => startDate.add(period.duration).toDayEnd;

  bool get isTaxFree => _isTaxFree;
  set isTaxFree(final bool v) => setState(() => _isTaxFree = v);

  bool get countWithTransfers => _countWithTransfers;
  set countWithTransfers(final bool v) =>
      setState(() => _countWithTransfers = v);

  TaskType get taskType => _taskType;
  set taskType(final TaskType v) => setState(() => _taskType = v);

  Period get period => _period;
  set period(final Period v) => setState(() => _period = v);
}
