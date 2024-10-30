import 'package:mastring_api/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}
final class LoadingSignin extends UserState {}
final class SucessSignin extends UserState{}
final class FailureSignin extends UserState{
  final String messageError;
  FailureSignin({required this.messageError});
}
final class LoadingSignUp extends UserState {}
final class SucessSignUp extends UserState{
  final String message;

  SucessSignUp({required this.message});

}
final class FailureSignUp extends UserState{
  final String messageError;
  FailureSignUp({required this.messageError});
}
final class UploadImageState extends UserState{}
final class GetUserLoading extends UserState {}
final class GetUserSucess extends UserState{
 final UserModel user;

  GetUserSucess({required this.user});
 
}
final class GetUserFailure extends UserState{
  final String messageError;
  GetUserFailure({required this.messageError});
}
