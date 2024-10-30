import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mastring_api/cache/cache_helper.dart';
import 'package:mastring_api/core/api/api_consumer.dart';
import 'package:mastring_api/core/api/end_points.dart';
import 'package:mastring_api/core/errors/exptions.dart';
import 'package:mastring_api/cubit/user_state.dart';
import 'package:mastring_api/models/signin_model.dart';
import 'package:mastring_api/models/signup_model.dart';
import 'package:mastring_api/models/user_model.dart';


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
      user = SigninModel.fromJson(response as Map<String, dynamic>);
      final   decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: Apikey.token, value: user!.token);
      CacheHelper().saveData(key: Apikey.id, value: decodedToken['id']);
      emit(SucessSignin());
    } on ServerException catch (e) {
      emit(FailureSignin(messageError: e.model.errorMessage));
    }
  }

  uploadImageFile(XFile image) {
    profilePic = image;
    emit(UploadImageState());
  }

  signUp() async {
    try {
      emit(LoadingSignUp());
      final response =
          await api.post(EndPoints.signUP, isFormData: true, data: {
        Apikey.profilePic: await uploadImageFile(profilePic!),
        Apikey.name: signUpName.text,
        Apikey.email: signUpEmail.text,
        Apikey.password: signUpPassword.text,
        Apikey.confirmPassword: signUpPassword.text,
        Apikey.location: {
          '"name": "Minia","address": "Malawy","coordinates": [30.1572709, 31.224779]'
        },
        Apikey.phone: signUpPhoneNumber.text
      });
      final signupModel =
          SignupModel.fromJson(response as Map<String, dynamic>);
      emit(SucessSignUp(message: signupModel.message));
    } on ServerException catch (e) {
      emit(FailureSignUp(messageError: e.model.errorMessage));
    }
  }

  getUserData() async {
    try {
      emit(GetUserLoading());
      final response = await api
          .get(EndPoints.userid(CacheHelper().getData(key: Apikey.id)));
          print(response);
       // emit(GetUserSucess(user: UserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(GetUserFailure(messageError: e.model.errorMessage));
    }
  }
}
