import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trivia_ui/api/api_settings.dart';
import 'package:trivia_ui/model/base_api_response.dart';
import 'package:trivia_ui/model/user_model.dart';

class ApiIndexUser {
  Future<List<User>> indexUser() async {
    var url = Uri.parse(ApiSettings.indexUser);
    var response = await http.get(url);
    print('response  : $response');
    if (response.statusCode == 200 || response.statusCode == 400) {
      print('response.statusCode is  ${response.statusCode}');
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['data'] as List;
        print(jsonArray);
        List<User> users = jsonArray
            .map((userJsonObjectMap) => User.fromJson(userJsonObjectMap))
            .toList();
        return users;
      }
    }
    return [];
  }
}
