import 'package:dio/dio.dart';
import 'package:mastring_api/core/errors/error_model.dart';

class ServerException implements Exception
{
final ErrorModel model;
  ServerException({required this.model});
} 
void handlingDioExption(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(model: error.response!.data);
      case DioExceptionType.sendTimeout:
        throw ServerException(model: error.response!.data);
      case DioExceptionType.receiveTimeout:
        throw ServerException(model: error.response!.data);
      case DioExceptionType.badCertificate:
        throw ServerException(model: error.response!.data);
      case DioExceptionType.cancel:
        throw ServerException(model: error.response!.data);
      case DioExceptionType.connectionError:
        throw ServerException(model: error.response!.data);
      case DioExceptionType.unknown:
        throw ServerException(model: error.response!.data);
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            throw ServerException(model: error.response!.data);
          case 401:
            throw ServerException(model: error.response!.data);
          case 403:
            throw ServerException(model: error.response!.data);
          case 409:
            throw ServerException(model: error.response!.data);
          case 422:
            throw ServerException(model: error.response!.data);
          case 504:
        }
    }
  }
