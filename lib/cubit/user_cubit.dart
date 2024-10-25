import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mastring_api/core/api/api_consumer.dart';
import 'package:mastring_api/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.apiConsumer) : super(UserInitial());
  //Sign in Form key
  final ApiConsumer apiConsumer;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  final Dio dio = Dio();
  Future<dynamic> signIn() async {
    emit(LoadingSignin());
    try {
      final response = await dio.post(
          'https://food-api-omega.vercel.app/api/v1/user/signin',
          data: {'email': signInEmail.text, 'password': signInPassword.text});
          if (kDebugMode) {
            print(response);
          }
      emit(SucessSignin());
      return response;
    } catch (e) {
      emit(FailureSignin(messageError: e.toString()));
    }
  }
}
