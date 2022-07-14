import 'package:flutter/material.dart';
import 'package:trivia_ui/model/api_response.dart';
import 'package:trivia_ui/model/student_moddel.dart';
import 'package:trivia_ui/utili/helper.dart';

import '../../api/controller/api_auth_controller.dart';
import '../../widget/custom_button.dart';
import '../../widget/social_media_button.dart';
import '../../widget/custome_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helper {
  late TextEditingController _emailController;

  late TextEditingController _passwordController;
  late TextEditingController _userNameController;

  bool isSecured = true;
  bool isAccept = false;

  String genderValue = 'M';

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    _emailController.dispose();
    _userNameController.dispose();
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
                'Sing UP',
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
              CustomTextField(
                keyboard: TextInputType.emailAddress,
                textController: _emailController,
                label: 'Email',
                preIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                keyboard: TextInputType.text,
                textController: _userNameController,
                label: 'Username',
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: RadioListTile(
                    value: 'M',
                    title: const Text('Male'),
                    groupValue: genderValue,
                    onChanged: (String? value) {
                      setState(() {
                        genderValue = value ?? 'M';
                      });
                    },
                  )),
                  Expanded(
                      child: RadioListTile(
                    value: 'F',
                    title: const Text('Female'),
                    groupValue: genderValue,
                    onChanged: (String? value) {
                      setState(() {
                        genderValue = value ?? 'F';
                      });
                    },
                  ))
                ],
              ),
              const SizedBox(height: 10),
              CheckboxListTile(

                  // checkColor: Colors.black,
                  activeColor: Colors.black,
                  value: isAccept,
                  onChanged: (value) {
                    setState(() {
                      isAccept = value ?? false;
                    });
                  },
                  subtitle: const Text('Term & Conditions',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  title: const Text(
                    'By creating an account,you agree to our',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () async => await performLogin(),
                title: 'Sing Up',
                iconData: Icons.login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.black87),
                    ),
                  )
                ],
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
    ApiResponse apiResponse =
        await ApiAuthController().register(student: student);
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.status);
    if (apiResponse.status) {
      Navigator.pop(context);
    }
  }

  Student get student {
    Student student = Student();
    student.password = _passwordController.text;
    student.email = _emailController.text;
    student.gender = genderValue;
    student.fullName = _userNameController.text;
    return student;
  }
}
