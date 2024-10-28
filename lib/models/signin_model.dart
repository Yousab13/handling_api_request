import 'package:mastring_api/core/api/end_points.dart';

class SigninModel {
  final String token ;
  final String message;

  SigninModel({required this.token, required this.message});
  factory SigninModel.fromJson(Map<String,dynamic>jsonData){
    return SigninModel
    (
      token: jsonData[Apikey.token] ,message:jsonData[Apikey.message] 
    );
  }
}