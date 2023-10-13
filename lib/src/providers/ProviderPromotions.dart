import 'package:multi_screen_app/src/providers/DefaultProvider.dart';
import 'package:multi_screen_app/src/models/ModelPromotion.dart';
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:multi_screen_app/src/providers/BaseAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';

class ProviderCategories extends DefaultProvider {
  List<ModelPromotion> _list = [];

  ProviderCategories(super.ctx);

  Future<void> fetchPromotions () async {
    if (list.isEmpty) {
      onLoading();

      // fetch
      final http.Response httpResult = await http.get(
          Uri.parse('${BaseAPI.routes['promotions']}'),
          headers: BaseAPI.authHeaders(user.token));

      // parse http result
      final ApiResponse response = ApiResponse.fromJson(jsonDecode(httpResult.body));

      // convert to list
      _list = response.results.map<ModelPromotion>((e) => ModelPromotion.fromJson(e)).toList();

      offLoading();
      notifyListeners();
    } else {
      print('[Promotions]: Using cached data');
    }
  }

  UnmodifiableListView<ModelPromotion> get list => UnmodifiableListView(_list);
}
