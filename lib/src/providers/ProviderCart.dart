import 'package:multi_screen_app/src/providers/DefaultProvider.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/models/ModelCart.dart';

import 'package:multi_screen_app/src/models/ModelPaymentIntent.dart';
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:multi_screen_app/src/providers/BaseAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderCart extends DefaultProvider {
  final ModelCart _cart = ModelCart();

  ModelProduct? _selectedProduct;
  bool _isProductScanned = false;
  bool _isProductInCart = false;

  ProviderCart(super.ctx);

  ModelCart get cart => _cart;
  double _discount = 0;

  List<CartDetail> get details => _cart.details;

  // === cart methods ===
  void addDetail (double quantity) {
    if (!isInCart(_selectedProduct!)) {
      _cart.addDetail(_selectedProduct!, quantity);
      _isProductInCart = true;
      fetchDiscount();
    }
  }
  void removeAt (int index) {
    _cart.removeAt(index);
    fetchDiscount();
  }
  void emptyCart () {
    _cart.emptyCart();
    _discount = 0;
    notifyListeners();
  }
  void updateQuantityAt (int index, double quantity) {
    _cart.updateQuantityAt(index, quantity);
    fetchDiscount();
  }
  bool isInCart (ModelProduct product) {
    return _cart.isInCart(product);
  }
  // ====================

  // === selected product methods ===
  bool get isProductScanned => _isProductScanned;
  bool get isProductInCart => _isProductInCart;
  ModelProduct get selectedProduct {
    if (_selectedProduct != null) {
      return _selectedProduct!;
    }
    throw ArgumentError('not selected product found');
  }
  void selectProduct (ModelProduct product, { bool isScanned = false }) {
    _selectedProduct = product;
    _isProductScanned = isScanned;
    _isProductInCart = isInCart(product);
  }
  void unselectProduct () {
    _selectedProduct = null;
    _isProductScanned = false;
    _isProductInCart = false;
  }
  // ================================

  Future<ModelPaymentIntent?> fetchPaymentIntent () async {
    onLoading();

    // fetch
    final http.Response httpResult = await http.post(
        Uri.https(BaseAPI.authority, '${BaseAPI.routes['cart']}/payment_intent'),
        headers: BaseAPI.authHeaders(user.token),
        body: jsonEncode(<String, double> {
          'total': _cart.total
        })
    );

    // parse http result
    final ApiResponse response = ApiResponse.fromJson(jsonDecode(httpResult.body));

    // convert to list
    offLoading();
    if (response.isSuccess()) {
      return ModelPaymentIntent.fromJson(response.results);
    } else {
      return null;
    }
  }

  double get total => _cart.total;
  double get discount => _discount;
  double get newTotal => _cart.total - _discount;
  Future<ModelPaymentIntent?> fetchDiscount () async {
    onLoading();

    // fetch
    final http.Response httpResult = await http.post(
        Uri.https(BaseAPI.authority, '${BaseAPI.routes['cart']}/calc_discount'),
        headers: BaseAPI.authHeaders(user.token),
        body: _cart.toJson()
    );

    // parse http result
    final ApiResponse response = ApiResponse.fromJson(jsonDecode(httpResult.body));

    // convert to list
    offLoading();
    if (response.isSuccess()) {
      _discount = response.results.toDouble();
    }
    notifyListeners();
  }
}
