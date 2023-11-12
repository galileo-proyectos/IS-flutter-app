import 'dart:convert';
import 'package:multi_screen_app/src/models/ModelProduct.dart';

class ModelCart {
  ModelCart();

  final List<CartDetail> _details = [];
  double _total = 0;

  void emptyCart () {
    _details.clear();
    _total = 0;
  }

  // details
  List<CartDetail> get details => _details;
  void addDetail (ModelProduct product, double quantity) {
    _details.add(CartDetail(product, quantity));
    _total += product.price * quantity;
  }
  void removeAt (int index) {
    _total -= _details[index].product.price * _details[index].quantity;
    _details.removeAt(index);
  }
  void updateQuantityAt (int index, double quantity) {
    // remove old total
    _total -= _details[index].product.price * _details[index].quantity;
    _details.removeAt(index);

    _details[index].setQuantity(quantity);

    // add new total
    _total += _details[index].product.price * quantity;
  }
  bool isInCart (ModelProduct product) {
    for (final detail in _details) {
      if (detail.product.code == product.code) {
        return true;
      }
    }
    return false;
  }

  @override
  String toJson () {
    return jsonEncode(<String, dynamic> {
      'details': _details
    });
  }

  // total
  double get total => _total;
}

class CartDetail {
  final ModelProduct _product;
  double _quantity;

  CartDetail(this._product, this._quantity);

  @override
  Map<String, dynamic> toJson () {
    return <String, dynamic> {
      'productCode': _product.code,
      'price': _product.price,
      'quantity': _quantity
    };
  }

  // getters and setters
  ModelProduct get product => _product;

  double get quantity => _quantity;
  void setQuantity (double quantity) {
    _quantity = quantity;
  }
}