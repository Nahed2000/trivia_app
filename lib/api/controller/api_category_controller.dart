import 'dart:convert';

import 'package:trivia_ui/api/api_helper.dart';
import 'package:trivia_ui/api/api_settings.dart';
import 'package:trivia_ui/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_ui/model/category_model.dart';

class ApiCategoryController with ApiHelper {
  Future<List<Category>> indexCategory() async {
    var url = Uri.parse(ApiSettings.category);
    var response = await http.get(url);
    print('response.statusCode : ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('response.statusCode : ${response.statusCode}');
      var jsonArray = jsonResponse['data'] as List;
      List<Category> category =
          jsonArray.map((e) => Category.fromJson(e)).toList();
      return category ;
    }
    return [];
  }
}
