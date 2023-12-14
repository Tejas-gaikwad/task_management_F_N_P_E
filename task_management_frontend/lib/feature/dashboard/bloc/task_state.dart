part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TasksInitialState extends TaskState {}

final class TasksLoadingState extends TaskState {}

final class TasksLoadedState extends TaskState {
  final List<TaskModel> allTasks;

  const TasksLoadedState(this.allTasks);
}

class TaskErrorState extends TaskState {
  final String message;
  const TaskErrorState({required this.message});

  List<Object> get props => [message];
}

class TaskAddedSuccessFullyState extends TaskState {
  final TaskModel task;
  const TaskAddedSuccessFullyState({required this.task});
  List<Object> get props => [task];
}

class SelectedDateState extends TaskState {
  final DateTime date;
  const SelectedDateState({required this.date});
  List<Object> get props => [date];
}

final class TaskAddedState extends TaskState {}
