import 'package:dio/dio.dart';
import 'package:mastring_api/core/api/api_consumer.dart';
import 'package:mastring_api/core/errors/exptions.dart';
class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio});
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameter}) async {
    try {
      final response =
          await dio.delete(path, data: data, queryParameters: queryParameter);
      return response.data;
    } on DioException catch (error) {
      handlingDioExption(error);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameter}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameter);
      return response.data;
    } on DioException catch (error) {
      handlingDioExption(error);
    }
  }

  @override
  Future patch(String path,
      {Object? data, Map<String, dynamic>? queryParameter}) async {
    try {
      final response =
          await dio.patch(path, data: data, queryParameters: queryParameter);
      return response.data;
    } on DioException catch (error) {
      handlingDioExption(error);
    }
  }

  @override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameter}) async {
    try {
      final response =
          await dio.post(path, data: data, queryParameters: queryParameter);
      return response.data;
    } on DioException catch (error) {
      handlingDioExption(error);
    }
  }
}
