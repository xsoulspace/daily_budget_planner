import 'package:mobile_app/common_imports.dart';

@resource
class IncomeTasksResource extends OrderedMapNotifier<TaskId, Task> {
  IncomeTasksResource() : super(toKey: (final task) => task.id);
}

@resource
class ExpenseTasksResource extends OrderedMapNotifier<TaskId, Task> {
  ExpenseTasksResource() : super(toKey: (final task) => task.id);
}

@Deprecated('remove it')
class TasksResource extends ChangeNotifier {
  var _incomeTasks = <Task>[].unmodifiable;
  var _expenseTasks = <Task>[].unmodifiable;

  List<Task> get incomeTasks => _incomeTasks;
  List<Task> get expenseTasks => _expenseTasks;

  void upsertTask(final Task task) {
    final updatedTasks = switch (task.transactionType) {
      TaskTransactionType.income => [..._incomeTasks, task],
      TaskTransactionType.expense => [..._expenseTasks, task],
    }.unmodifiable;
    final _ = switch (task.transactionType) {
      TaskTransactionType.expense => _expenseTasks = updatedTasks,
      TaskTransactionType.income => _incomeTasks = updatedTasks,
    };
    notifyListeners();
  }

  void setIncomeTasks({
    required final List<Task> tasks,
    required final TaskType taskType,
  }) {}

  void setExpenseTasks({
    required final List<Task> tasks,
    required final TaskType taskType,
  }) {
    assert(tasks.isNotEmpty, 'tasks is empty');

    _expenseTasks = tasks
        .where((final type) {
          final isVisible = type.type == taskType;
          return isVisible;
        })
        .toList()
        .unmodifiable;
    notifyListeners();
  }
}

final class TasksResourcesHelper with HasResources {
  const TasksResourcesHelper();
  Task getTaskById(
    final TaskId id, {
    required final TaskTransactionType transactionType,
  }) =>
      (switch (transactionType) {
        TaskTransactionType.income => incomeTasksResource[id],
        TaskTransactionType.expense => expenseTasksResource[id],
      }) ??
      Task.empty;

  List<Task> getTasks(final TaskTransactionType transactionType) =>
      switch (transactionType) {
        TaskTransactionType.income => incomeTasksResource.orderedValues,
        TaskTransactionType.expense => expenseTasksResource.orderedValues,
      };
}
