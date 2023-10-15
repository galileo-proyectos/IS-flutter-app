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

  Future<void> fetchProducts ({ String? name, int? categoryId }) async {
    onLoading();

    // preparing query params
    final Map<String, String> queryParams = {};
    if (name != null && name.isNotEmpty) {
      queryParams['name'] = name;
    }
    if (categoryId != null) {
      queryParams['categoryId'] = categoryId.toString();
    }

    // fetch
    final http.Response httpResult = await http.get(
      Uri.https(BaseAPI.authority, BaseAPI.routes['products']!, queryParams.isNotEmpty ? queryParams : null),
      headers: BaseAPI.authHeaders(user.token)
    );

    // parse http result
    final ApiResponse response =  ApiResponse.fromJson(jsonDecode(httpResult.body));

    // convert to list
    _list = response.results.map<ModelProduct>((e) => ModelProduct.fromJson(e)).toList();

    offLoading();
    notifyListeners();
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
