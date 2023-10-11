import 'dart:convert';
import 'dart:collection';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';
import 'package:multi_screen_app/src/providers/BaseAPI.dart';

class ProviderProducts extends ChangeNotifier {
  bool _loading = false;
  final ModelUser _user;
  List<ModelProduct> _list = [];

  ProviderProducts(BuildContext ctx):
        _user = Provider.of<ProviderUser>(ctx, listen: false).user
  {
    if (!_user.isLoggedIn()) {
      throw ArgumentError.notNull('user');
    }
  }

  Future<void> fetchProducts () async {
    if (list.isEmpty) {
      _loading = true;

      // fetch
      final http.Response httpResult = await http.get(
        Uri.parse(BaseAPI.routes['products']!),
        headers: BaseAPI.authHeaders(_user.token)
      );

      // parse http result
      final ApiResponse response =  ApiResponse.fromJson(jsonDecode(httpResult.body));

      // convert to list
      _list = response.results.map<ModelProduct>((e) => ModelProduct.fromJson(e)).toList();

      _loading = false;
      notifyListeners();
    } else {
      print('[Products]: Using cached data');
    }
  }

  UnmodifiableListView<ModelProduct> get list => UnmodifiableListView(_list);
  bool isLoading () => _loading;
}
