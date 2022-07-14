import 'package:flutter/material.dart';
import 'package:trivia_ui/api/controller/api_auth_controller.dart';
import 'package:trivia_ui/model/api_response.dart';
import 'package:trivia_ui/screen/auth/rest_password_screen.dart';
import 'package:trivia_ui/utili/helper.dart';

import '../../widget/custom_button.dart';
import '../../widget/social_media_button.dart';
import '../../widget/custome_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with Helper {
  late TextEditingController _emailController;

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forget Password',
                style: TextStyle(fontSize: 33),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your email id to reset your password',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                keyboard: TextInputType.emailAddress,
                textController: _emailController,
                label: 'Email',
                preIcon: Icons.person_outline,
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomButton(
                  onTap: () async => await performForgetPassword(),
                  title: 'Sing IN',
                  iconData: Icons.login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    }
  }

  bool checkData() {
    if (_emailController.text.isNotEmpty
        // _passwordController.text.isNotEmpty
        ) {
      return true;
    }
    showSnackBar(context, message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> forgetPassword() async {
    ApiResponse apiResponse =
        await ApiAuthController().forgetPassword(email: _emailController.text);
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.status);
    if (apiResponse.status) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RestPasswordScreen(
              email: _emailController.text,
            ),
          ));
    }
  }
}
