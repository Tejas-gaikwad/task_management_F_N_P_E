part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TasksFetchEvent extends TaskEvent {
  const TasksFetchEvent();

  @override
  List<Object> get props => [];
}

class TaskAddEvent extends TaskEvent {
  final String taskName;
  final String taskDescription;
  final DateTime taskDate;
  final double taskPriority;
  const TaskAddEvent({
    required this.taskName,
    required this.taskDescription,
    required this.taskDate,
    required this.taskPriority,
  });

  @override
  List<Object> get props => [
        taskName,
        taskDescription,
        taskDate,
        taskPriority,
      ];
}

class SelectTaskDate extends TaskEvent {
  final DateTime dateTime;
  const SelectTaskDate({
    required this.dateTime,
  });

  List<Object> get props => [dateTime];
}
