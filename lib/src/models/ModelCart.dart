import 'dart:convert';

import 'package:multi_screen_app/src/models/ModelProduct.dart';

class ModelCart {
  ModelCart();

  CartConsumer _consumer = CartConsumer.defaultConsumer;
  CartCard _card = CartCard.defaultCard;
  final List<CartDetail> _details = [];
  double _discount = 0;
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

  bool hasConsumer () => _consumer != CartConsumer.defaultConsumer;
  bool hasCard () => _card != CartCard.defaultCard;

  // consumer
  CartConsumer get consumer => _consumer;
  void setConsumer (String businessName, String nit) {
    _consumer = CartConsumer(businessName, nit);
  }

  // card
  CartCard? get card => _card;
  void setCard (String cardHolder, String number, String date, String ccv) {
    _card = CartCard(cardHolder, number, date, ccv);
  }

  // total
  double get discount => _discount;
  double get total => _total;
}

class CartDetail {
  final ModelProduct _product;
  double _quantity;

  CartDetail(this._product, this._quantity);

  String toJSON () {
    return jsonEncode(<String, dynamic> {
      'productCode': _product.code,
      'price': _product.price,
      'amount': _quantity
    });
  }

  // getters and setters
  ModelProduct get product => _product;

  double get quantity => _quantity;
  void setQuantity (double quantity) {
    _quantity = quantity;
  }
}

class CartCard {
  final String _cardHolder;
  final String _number;
  final String _date;
  final String _ccv;

  static const defaultCard = CartCard('', '', '', '');

  const CartCard(this._cardHolder, this._number, this._date, this._ccv);

// this class is pending to be change...
}

class CartConsumer {
  final String _businessName;
  final String _nit;

  static const CartConsumer defaultConsumer = CartConsumer('', '');

  const CartConsumer(this._businessName, this._nit);

  String get businessName => _businessName;
  String get nit => _nit;
}