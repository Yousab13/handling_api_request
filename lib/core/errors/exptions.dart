import 'package:dio/dio.dart';
import 'package:mastring_api/core/errors/error_model.dart';

class ServerException implements Exception
{
final ErrorModel model;
  ServerException({required this.model});
} 
void handlingDioExption(DioException error) {
  if (error.response != null && error.response!.data is Map<String, dynamic>) {
    final errorData = ErrorModel.fromJson(error.response!.data);
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
      case DioExceptionType.badResponse:
        throw ServerException(model: errorData);
      default:
        throw ServerException(model: ErrorModel(errorMessage: 'Unknown error' ,status: 1));
    }
  } else {
    throw ServerException(model: ErrorModel(errorMessage: 'Unknown error occurred' ,status: 1));
  }
}
