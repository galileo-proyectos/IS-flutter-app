import 'package:multi_screen_app/src/controllers/categories/categories.api.dart';
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:multi_screen_app/src/models/ModelCategory.dart';

class ControllerCategories {
  static Future<List<ModelCategory>> fetchCategories(String token) async {
    final ApiResponse response = await APICategories.fetchAll(token);
    return response.results.map((e) => ModelCategory.fromJson(e));
  }
}
