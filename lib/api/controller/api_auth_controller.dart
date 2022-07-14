import 'dart:async';
import 'dart:convert';

import 'package:trivia_ui/api/api_helper.dart';
import 'package:trivia_ui/api/api_settings.dart';
import 'package:trivia_ui/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_ui/storge/pref_controller.dart';

import '../../model/student_moddel.dart';

class ApiAuthController with ApiHelper {
  // TODO: login Methode
  Future<ApiResponse> login(
      {required String email, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response =
        await http.post(url, body: {"email": email, "password": password});
    print('response is $response');
    print('response.statusCode : ${response.statusCode}');

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      print('response.statusCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['object'];
        Student student = Student.fromJson(jsonObject);
        await SharedPrefController().save(student: student);
        return ApiResponse(
            message: jsonResponse['message'], status: jsonResponse['status']);
      }
      return ApiResponse(
          message: jsonResponse['message'], status: jsonResponse['status']);
    }
    //
    return errorServer;
  }

  //TODO: Create Account
  Future<ApiResponse> register({required Student student}) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      "email": student.email,
      "full_name": student.fullName,
      "password": student.password,
      "gender": student.gender
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], status: jsonResponse['status']);
    }
    return errorServer;
  }

//TODO: forget password
  Future<ApiResponse> forgetPassword({required String email}) async {
    var url = Uri.parse(ApiSettings.forget);
    var response = await http.post(url, body: {"email": email});
    if (response.statusCode == 400 || response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) print(jsonResponse['code']);
      return ApiResponse(
          message: jsonResponse['message'], status: jsonResponse['status']);
    }
    return errorServer;
  }

//TODO: rest password
  Future<ApiResponse> restPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    var url = Uri.parse(ApiSettings.forget);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
      "code": code,
      "password_confirmation": password,
    });
    if (response.statusCode == 400 || response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) print(jsonResponse['code']);
      return ApiResponse(
          message: jsonResponse['message'], status: jsonResponse['status']);
    }
    return errorServer;
  }

  Future<ApiResponse> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 401 || response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      unawaited(SharedPrefController().clear());
      if (response.statusCode == 200) {
        return ApiResponse(
            message: jsonResponse['message'], status: jsonResponse['status']);
      }
      return ApiResponse(message: 'Logged out successfully ', status: true);
    }
    return errorServer;
  }
}
