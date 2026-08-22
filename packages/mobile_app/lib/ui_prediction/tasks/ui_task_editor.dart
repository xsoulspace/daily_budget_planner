import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_kit/molecules/ui_modal_sheet_route.dart';

Future<Task?> showTaskEditor(
  final BuildContext context, {
  required final Task? task,
}) => Navigator.of(context, rootNavigator: true).push(
  UiModalSheetRoute<Task>(builder: (final context) => _TaskEditor(task: task)),
);

class _TaskEditor extends StatefulHookWidget {
  const _TaskEditor({required this.task});

  final Task? task;

  @override
  State<_TaskEditor> createState() => _TaskEditorState();
}

class _TaskEditorState extends State<_TaskEditor> {
  @override
  Widget build(final BuildContext context) => const Placeholder();
}
