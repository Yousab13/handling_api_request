import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastring_api/core/api/dio_consumer.dart';
import 'package:mastring_api/cubit/user_cubit.dart';
import 'package:mastring_api/screens/sign_in_screen.dart';

void main() {
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
