import 'package:flutter/material.dart';
import 'package:trivia_ui/api/controller/api_auth_controller.dart';
import 'package:trivia_ui/model/api_response.dart';
import 'package:trivia_ui/utili/helper.dart';

import '../../widget/custom_button.dart';
import '../../widget/social_media_button.dart';
import '../../widget/custome_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helper {
  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  bool isSecured = true;

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                'Sing IN',
                style: TextStyle(fontSize: 33),
              ),
              const SizedBox(height: 30),
              SocialMediaButton(
                  title: 'Sign in with Facebook',
                  iconData: Icons.facebook,
                  color: const Color(0xff1877F2),
                  onPress: () {}),
              const SizedBox(height: 20),
              SocialMediaButton(
                title: 'Sign in with Google',
                iconData: Icons.email_outlined,
                onPress: () {},
                color: const Color(0xffF14336),
              ),
              const SizedBox(height: 30),
              Container(
                height: 170,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 10,
                      spreadRadius: 10),
                  // BoxShadow(color: Colors.grey),
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/illustration.png'),
                    const SizedBox(height: 10),
                    const Text(
                      'Today\'s Grand Prize',
                      style: TextStyle(
                        color: Color(0xffFCBD11),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                keyboard: TextInputType.emailAddress,
                textController: _emailController,
                label: 'Username or Email',
                preIcon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                keyboard: TextInputType.visiblePassword,
                textController: _passwordController,
                label: 'Password',
                preIcon: Icons.lock_outlined,
                isSecured: isSecured,
                sufIcon: isSecured
                    ? Icons.visibility_off_outlined
                    : Icons.visibility,
                sufPress: () {
                  setState(() {
                    isSecured = !isSecured;
                    print(isSecured);
                  });
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                onTap: () async => await performLogin(),
                title: 'Sing IN',
                iconData: Icons.login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('don\'t have a account?'),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/register_screen'),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.black87),
                    ),
                  )
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/forget_password_screen'),
                  child: const Text(
                    'Forget Password ? ',
                    style: TextStyle(color: Color(0xff082FA4)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> login() async {
    ApiResponse apiResponse = await ApiAuthController().login(
        email: _emailController.text, password: _passwordController.text);
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.status);
    if (apiResponse.status) {
      Navigator.pushReplacementNamed(context, '/home_screen');
    }
  }
}
