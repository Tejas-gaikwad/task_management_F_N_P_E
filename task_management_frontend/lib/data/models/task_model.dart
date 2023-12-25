class TaskModel {
  final String? id;
  final String? taskName;
  final double? taskPriority;
  final String? taskDescription;
  final DateTime? taskStartDate;

  TaskModel({
    required this.id,
    this.taskName,
    this.taskPriority,
    this.taskDescription,
    this.taskStartDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['task_id'],
      taskName: json['task_name'],
      taskPriority: json['task_priority'].toDouble(),
      taskDescription: json['task_desc'],
      taskStartDate: DateTime.parse(json['task_date']),
    );
  }
}
