import 'package:mastring_api/core/api/end_points.dart';

class ErrorModel {
  final int statusCode;
  final String messageError;
  ErrorModel({required this.statusCode, required this.messageError});
  factory ErrorModel.fromJson(data){
    return ErrorModel(statusCode: data[Apikey.status], messageError: data[Apikey.errorMessage]);
  }
}