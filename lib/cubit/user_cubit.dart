
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mastring_api/core/api/api_consumer.dart';
import 'package:mastring_api/core/api/end_points.dart';
import 'package:mastring_api/core/errors/exptions.dart';
import 'package:mastring_api/cubit/user_state.dart';
import 'package:mastring_api/models/signin_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  //Sign in Form key
  final ApiConsumer api;
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
  // Signin model 
 SigninModel? user;

  signIn() async {
    try {
      emit(LoadingSignin());
      final response = await api.post(
       EndPoints.signIn,
        data: {
          Apikey.email: signInEmail.text,
          Apikey.password: signInPassword.text,
        },
      );
      user = SigninModel.fromJson(response);
      // ignore: unused_local_variable
      final decodedToken = JwtDecoder.decode(user!.token);
      // ignore: avoid_print
      // print(decodedToken);
      emit(SucessSignin());
    } on ServerException catch (e) {
      emit(FailureSignin(messageError:  e.model.messageError));
    }
  }
}
