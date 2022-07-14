import 'dart:io';

import 'package:trivia_ui/model/api_response.dart';
import 'package:trivia_ui/storge/pref_controller.dart';

mixin ApiHelper {
  Map<String, String> get headers {
    Map<String, String> headers = <String, String>{};
    headers[HttpHeaders.acceptHeader] = 'application/json';
    if (SharedPrefController().loggedIn) {
      headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
    }
    return headers;
  }

  ApiResponse get errorServer {
    return ApiResponse(message: 'Something went wrong', status: false);
  }
}
