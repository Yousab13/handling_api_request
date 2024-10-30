import 'package:mastring_api/core/api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage,});
  factory ErrorModel.fromJson(jsonData) {
    return ErrorModel(
      status: jsonData[Apikey.status],
      errorMessage: jsonData[Apikey.errorMessage],
    );
  }
}