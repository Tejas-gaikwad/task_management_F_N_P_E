import 'package:bloc/bloc.dart';
import 'package:task_management_frontend/data/models/task_model.dart';
import 'package:uuid/uuid.dart';
import '../../../data/repo/tasks/task_repo_impl.dart';
import 'package:equatable/equatable.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<TaskModel> _tasks = [];
  var uuid = const Uuid();

  final taskRepo = TaskRepoImpl();

  TaskBloc() : super(TasksInitialState()) {
    on<TasksFetchEvent>((event, emit) async {
      emit(TasksFetchingState());
      try {
        print('Fetching tasks ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        _tasks = await taskRepo.getAllTasks();
        print('ALL tasks are  ->>>      $_tasks');
        emit(TasksLoadedState(_tasks));
      } catch (error) {
        print('error =>>>>>>>>>   ${error}');
        emit(TaskErrorState(message: error.toString()));
      }
    });

    on<TaskAddEvent>((event, emit) async {
      emit(TasksLoadingState());
      String uniqueId = uuid.v4();

      try {
        final response = await taskRepo.createTask(
          taskId: uniqueId,
          taskDate: event.taskDate,
          taskDescription: event.taskDescription,
          taskName: event.taskName,
          taskPriority: event.taskPriority,
        );
        final responseTaskData = response.data['data'];
        final taskmodeldata = TaskModel.fromJson(responseTaskData);
        emit(TaskAddedSuccessFullyState(task: taskmodeldata));
      } catch (error) {
        print('ERROR Add task ->>   $error');
        emit(TaskErrorState(message: error.toString()));
      }
    });

    on<SelectTaskDate>((event, emit) async {
      // emit(TasksLoadingState());
      emit(SelectedDateState(date: event.dateTime));
    });
  }
}
