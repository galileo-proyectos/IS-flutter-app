import 'package:multi_screen_app/src/providers/DefaultProvider.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:multi_screen_app/src/providers/BaseAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';

class ProviderProducts extends DefaultProvider {
  List<ModelProduct> _list = [];
  ModelProduct? _selectedProduct;

  ProviderProducts(super.ctx);

  Future<void> fetchProducts () async {
    if (list.isEmpty) {
      onLoading();

      // fetch
      final http.Response httpResult = await http.get(
        Uri.parse(BaseAPI.routes['products']!),
        headers: BaseAPI.authHeaders(user.token)
      );

      // parse http result
      final ApiResponse response =  ApiResponse.fromJson(jsonDecode(httpResult.body));

      // convert to list
      _list = response.results.map<ModelProduct>((e) => ModelProduct.fromJson(e)).toList();

      offLoading();
      notifyListeners();
    } else {
      print('[Products]: Using cached data');
    }
  }

  ModelProduct get selectedProduct {
    if (_selectedProduct != null) {
      return _selectedProduct!;
    }
    throw ArgumentError('not selected product found');
  }
  void selectProduct (ModelProduct product) {
    _selectedProduct = product;
  }

  UnmodifiableListView<ModelProduct> get list => UnmodifiableListView(_list);
}
