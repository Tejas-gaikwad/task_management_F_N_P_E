import 'package:get_it/get_it.dart';
import 'tasks/task_repo.dart';
import 'tasks/task_repo_impl.dart';

final getIt = GetIt.instance;

void initRepo() {
  getIt.registerLazySingleton<TaskRepo>(() => TaskRepoImpl());
}

TaskRepo get productRepo => getIt.get<TaskRepo>();
