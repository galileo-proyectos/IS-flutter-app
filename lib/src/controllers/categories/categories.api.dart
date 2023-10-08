import 'dart:convert';

import 'package:multi_screen_app/src/controllers/BaseAPI.dart';
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:http/http.dart' as http;

class APICategories extends BaseAPI {
  static Future<ApiResponse> fetchAll(String token) async {
    final response = await http.get(
        Uri.parse('${BaseAPI.routes['categories']}'),
        headers: BaseAPI.headers(token));

    return ApiResponse.fromJson(jsonDecode(response.body));
  }
}