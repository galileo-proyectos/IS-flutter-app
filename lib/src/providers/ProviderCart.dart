import 'package:multi_screen_app/src/providers/DefaultProvider.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/models/ModelCart.dart';

class ProviderCart extends DefaultProvider {
  final ModelCart _cart = ModelCart();

  ModelProduct? _selectedProduct;
  bool _isProductScanned = false;
  bool _isProductInCart = false;

  ProviderCart(super.ctx);

  ModelCart get cart => _cart;

  List<CartDetail> get details => _cart.details;

  // === cart methods ===
  void addDetail (double quantity) {
    if (!isInCart(_selectedProduct!)) {
      _cart.addDetail(_selectedProduct!, quantity);
      _isProductInCart = true;
      notifyListeners();
    }
  }
  void removeAt (int index) {
    _cart.removeAt(index);
    notifyListeners();
  }
  void updateQuantityAt (int index, double quantity) {
    _cart.updateQuantityAt(index, quantity);
    notifyListeners();
  }
  bool isInCart (ModelProduct product) {
    return _cart.isInCart(product);
  }
  // ====================

  // === selected product methods ===
  bool get isProductScanned => _isProductScanned;
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

  void setConsumer (String businessName, String nit) {
    _cart.setConsumer(businessName, nit);
    notifyListeners();
  }

  void setCard (String cardHolder, String number, String date, String ccv) {
    _cart.setCard(cardHolder, number, date, ccv);
    notifyListeners();
  }
}
