import 'package:task_management_frontend/data/models/api_response.dart';

import '../../../app/config/server_config.dart';
import '../../../utils/exceptions/exceptions.dart';
import '../../models/task_model.dart';
import '../../service/service.dart';
import 'task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  List<TaskModel> tasksList = [];

  @override
  Future<List<TaskModel>> getAllTasks({String? category}) async {
    try {
      final String url;

      final response = await apiService.get(
          path: '${baseUrl}/getAllTasks'); //TODO path for the route

      if (response.statusCode == 200) {
        // final list = (response.data['data'])
        //     .map((task) => TaskModel.fromJson(task))
        //     .toList();

        for (var task in response.data['data']) {
          final eachTask = TaskModel.fromJson(task);
          tasksList.add(eachTask);
        }

        print('tasksList  ->>>>    ${tasksList}');

        return tasksList;
      }

      return [];
    } catch (e) {
      print('Errror  ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>    ${e}');
      throw RepoException("Error while fetching Tasks");
    }
  }

  @override
  Future<ApiResponse> createTask({
    required String taskId,
    required String taskName,
    required String taskDescription,
    required DateTime taskDate,
    required double taskPriority,
  }) async {
    try {
      final response = await apiService.post(
        path: '$baseUrl/createTask',
        data: {
          'task_id': taskId,
          'task_name': taskName,
          'task_desc': taskDescription,
          'task_date': taskDate.toIso8601String(),
          'task_priority': taskPriority,
        },
      );

      return response;
    } catch (e) {
      throw RepoException("Error while adding Tasks");
    }
  }
}
