// Init Service
import 'package:get_it/get_it.dart';
import 'api/api_service_impl.dart';

final getIt = GetIt.instance;

void initService() {
  getIt.registerLazySingleton<ApiServiceImpl>(() => ApiServiceImpl());
}

ApiServiceImpl get apiService => getIt.get<ApiServiceImpl>();
