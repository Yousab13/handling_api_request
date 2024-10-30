import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastring_api/cache/cache_helper.dart';
import 'package:mastring_api/core/api/dio_consumer.dart';
import 'package:mastring_api/cubit/user_cubit.dart';
import 'package:mastring_api/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
 late SharedPreferences sharedPreferences;
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   sharedPreferences = await SharedPreferences.getInstance(); 
   print(CacheHelper().getData(key: 'token'));
   print(CacheHelper().getData(key: 'id'));
  runApp(
    BlocProvider(
      create: (context) => UserCubit( DioConsumer(dio: Dio())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
