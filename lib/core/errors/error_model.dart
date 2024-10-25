class ErrorModel {
  final int statusCode;
  final String messageError;
  ErrorModel({required this.statusCode, required this.messageError});
  factory ErrorModel.fromJson(data){
    return ErrorModel(statusCode: data["status"], messageError: data["ErrorMessage"]);
  }
}