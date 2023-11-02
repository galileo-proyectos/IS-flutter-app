import 'package:multi_screen_app/src/providers/DefaultProvider.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/models/ModelCart.dart';

class ProviderCart extends DefaultProvider {
  final ModelCart _cart = ModelCart();

  ProviderCart(super.ctx);

  ModelCart get cart => _cart;

  List<CartDetail> get details => _cart.details;

  void addDetail (ModelProduct product, double quantity) {
    if (!isInCart(product)) {
      _cart.addDetail(product, quantity);
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

  void setConsumer (String businessName, String nit) {
    _cart.setConsumer(businessName, nit);
    notifyListeners();
  }

  void setCard (String cardHolder, String number, String date, String ccv) {
    _cart.setCard(cardHolder, number, date, ccv);
    notifyListeners();
  }
}
