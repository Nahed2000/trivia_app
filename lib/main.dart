import 'package:flutter/material.dart';
import 'package:trivia_ui/screen/auth/forget_password.dart';
import 'package:trivia_ui/screen/auth/register_screen.dart';
import 'package:trivia_ui/screen/bn_screen.dart';
import 'package:trivia_ui/screen/category_screen.dart';
import 'package:trivia_ui/screen/auth/login_screen.dart';
import 'package:trivia_ui/screen/lunch_screen.dart';
import 'package:trivia_ui/screen/user_screen.dart';



void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/lunch_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        '/lunch_screen':(context) => const LunchScreen(),
        '/bn_screen':(context) => const BnScreen(),
        '/user_screen':(context) => const UserScreen(),
        '/category_screen':(context) => const CategoryScreen(),
        '/login_screen':(context) => const LoginScreen(),
        '/register_screen':(context) => const RegisterScreen(),
        '/forget_password_screen':(context) => const ForgetPasswordScreen()
      },
    );
  }
}
