import 'package:flutter/material.dart';
import 'package:trivia_ui/api/controller/api_auth_controller.dart';
import 'package:trivia_ui/model/api_response.dart';
import 'package:trivia_ui/utili/helper.dart';

import '../../widget/text_code_node.dart';

class RestPasswordScreen extends StatefulWidget {
  final String email;

  const RestPasswordScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<RestPasswordScreen> createState() => _RestPasswordScreenState();
}

class _RestPasswordScreenState extends State<RestPasswordScreen> with Helper {
  late TextEditingController _passwordConfirmationController;
  late TextEditingController _passwordController;
  late TextEditingController _firstController;
  late TextEditingController _secondController;
  late TextEditingController _thirdController;
  late TextEditingController _forthController;

  late FocusNode _firstNode;
  late FocusNode _secondNode;
  late FocusNode _thirdNode;
  late FocusNode _forthNode;

  String _code = '';

  @override
  void initState() {
    // TODO: implement initState
    _passwordConfirmationController = TextEditingController();
    _passwordController = TextEditingController();

    _firstController = TextEditingController();
    _secondController = TextEditingController();
    _thirdController = TextEditingController();
    _forthController = TextEditingController();

    _firstNode = FocusNode();
    _secondNode = FocusNode();
    _thirdNode = FocusNode();
    _forthNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmationController.dispose();

    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _forthController.dispose();

    _firstNode.dispose();
    _secondNode.dispose();
    _thirdNode.dispose();
    _forthNode.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rest Password',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const Text(
                'ResetPassword ?...!',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                'Enter New password ',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  height: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextCodeNode(
                      textController: _firstController,
                      focusNode: _firstNode,
                      onPress: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            _secondNode.requestFocus();
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextCodeNode(
                      textController: _secondController,
                      focusNode: _secondNode,
                      onPress: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            _thirdNode.requestFocus();
                          } else {
                            _firstNode.requestFocus();
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextCodeNode(
                      textController: _thirdController,
                      focusNode: _thirdNode,
                      onPress: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            _forthNode.requestFocus();
                          } else {
                            _secondNode.requestFocus();
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextCodeNode(
                      textController: _forthController,
                      focusNode: _forthNode,
                      onPress: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            _thirdNode.requestFocus();
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 0.8, color: Colors.blue.shade300),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'New Password'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordConfirmationController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 0.8, color: Colors.blue.shade300),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'New Password Confirmation'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async => await _performResetPassword(),
                child: const Text('Confirmed'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade800,
                  minimumSize: const Size(0, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performResetPassword() async {
    if (checkData()) {
      await restPassword();
    }
  }

  bool checkData() {
    if (_checkCode() && _checkPassword()) {
      return true;
    }
    return false;
  }

  bool _checkPassword() {
    if (_passwordConfirmationController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      if (_passwordConfirmationController.text.isNotEmpty ==
          _passwordController.text.isNotEmpty) {
        return true;
      } else {
        showSnackBar(context,
            message: 'Password and confirmation password dose not match',
            error: true);
        return false;
      }
    }
    showSnackBar(context, message: 'Enter Required Data', error: true);
    return false;
  }

  bool _checkCode() {
    if (_firstController.text.isNotEmpty &&
        _secondController.text.isNotEmpty &&
        _thirdController.text.isNotEmpty &&
        _forthController.text.isNotEmpty) {
      _getCode();
      return true;
    }
    showSnackBar(context,
        message: 'Enter Password & Confirmation', error: true);
    return false;
  }

  String _getCode() {
    return _code = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _forthController.text;
  }

  Future<void> restPassword() async {
    ApiResponse apiResponse = await ApiAuthController().restPassword(
      email: widget.email,
      code: _code,
      password: _passwordController.text,
    );
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.status);
    if (apiResponse.status) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }
}
