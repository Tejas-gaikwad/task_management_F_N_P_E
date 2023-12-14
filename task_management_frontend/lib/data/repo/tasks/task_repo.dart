// // Product Repo
import 'package:task_management_frontend/data/models/api_response.dart';

import '../../models/task_model.dart';

abstract class TaskRepo {
  Future<List<TaskModel>> getAllTasks();

  Future<ApiResponse> createTask({
    required String taskId,
    required String taskName,
    required String taskDescription,
    required DateTime taskDate,
    required double taskPriority,
  });
}
