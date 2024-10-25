 class UserState {}

final class UserInitial extends UserState {}
final class LoadingSignin extends UserState {}
final class SucessSignin extends UserState{}
final class FailureSignin extends UserState{
  final String messageError;
  FailureSignin({required this.messageError});
}

