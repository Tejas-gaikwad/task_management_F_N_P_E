import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../../models/api_response.dart';

class ApiServiceImpl {
  late Dio _dio;

  void init({required String baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );
  }

  Future<ApiResponse> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);

      return ApiResponse.fromDioResponse(
        response,
      );
    } on DioException catch (e) {
      return ApiResponse.error(e.toString());
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> post({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(
          method: 'POST',
          contentType: 'application/json',
          headers: {
            'content-type': 'application/json',
          },
        ),
      );
      print('dio repppppponse +>>>   ${response.data}');

      return ApiResponse.fromDioResponse(
        response,
      );
    } on DioException catch (e) {
      print('DioException  ->>>   ${e.error}');
      print('DioException message ->>>   ${e.message}');
      return ApiResponse.error(e.toString());
    } catch (e) {
      print('Catch  ERROR ->>>   ${e}');
      return ApiResponse.error(e.toString());
    }
  }
}
