import 'package:dio/dio.dart';
import 'package:mastring_api/core/api/api_consumer.dart';
import 'package:mastring_api/core/api/api_interseptors.dart';
import 'package:mastring_api/core/api/end_points.dart';
import 'package:mastring_api/core/errors/exptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }
  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = false}) async {
    try {
      final response = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameter);
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
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = false}) async {
    try {
      final response = await dio.patch(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameter);
      return response.data;
    } on DioException catch (error) {
      handlingDioExption(error);
    }
  }

  @override
Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = false}) async {
    try {
      final response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameter);
      return response.data;
    } on DioException catch (error) {
      handlingDioExption(error);
    }
  }
}
