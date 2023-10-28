import 'dart:ffi';

import 'package:flutter/cupertino.dart';
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

  // filters
  final TextEditingController nameFilter = TextEditingController();
  final List<int> categoryIdsFilter = [];
  bool isProductScanned = false;

  bool _showFilters = false;

  ProviderProducts(super.ctx);

  Future<void> fetchProducts () async {
    final String name = nameFilter.text;
    final String categoryIds = categoryIdsFilter.map((e) => e.toString()).join(',');

    if (name.isNotEmpty || categoryIds.isNotEmpty || list.isEmpty) {
      onLoading();

      // preparing query params
      final Map<String, String> queryParams = {};
      if (name != null && name.isNotEmpty) {
        queryParams['name'] = name;
      }
      if (categoryIds.isNotEmpty) {
        queryParams['categoryIds'] = categoryIds;
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
  }

  Future<void> initProductList () async {
    if (list.isEmpty || categoryIdsFilter.isNotEmpty) {
      await fetchProducts();
    }
  }

  Future<bool> fetchAndSelectProduct (String productCode) async {
    onLoading();

    // fetch
    final http.Response httpResult = await http.get(
        Uri.https(BaseAPI.authority, '${BaseAPI.routes['products']}/$productCode/code'),
        headers: BaseAPI.authHeaders(user.token)
    );

    // parse http result
    final ApiResponse response =  ApiResponse.fromJson(jsonDecode(httpResult.body));

    // convert to list
    if (response.isSuccess()) {
      _selectedProduct = ModelProduct.fromJson(response.results);
    }

    offLoading();
    notifyListeners();
    return response.isSuccess();
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

  bool get showFilters => _showFilters;
  void setShowFilters (bool value) {
    if (_showFilters != value) {
      _showFilters = value;
      notifyListeners();
    }
  }

  void setCategoryIdsFilter (List<int> ids) {
    categoryIdsFilter.clear();
    categoryIdsFilter.addAll(ids);
  }

  UnmodifiableListView<ModelProduct> get list => UnmodifiableListView(_list);
}
