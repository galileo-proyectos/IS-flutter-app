import 'package:multi_screen_app/src/providers/DefaultProvider.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/models/ModelCart.dart';
import 'package:http/http.dart' as http;

class ProviderCart extends DefaultProvider {
  final ModelCart _cart = ModelCart();

  ProviderCart(super.ctx);

  ModelCart get cart => _cart;
  void addDetail (ModelProduct product, double quantity) {
    _cart.addDetail(product, quantity);
    notifyListeners();
  }
  void removeAt (int index) {
    _cart.removeAt(index);
    notifyListeners();
  }
  void updateQuantityAt (int index, double quantity) {
    _cart.updateQuantityAt(index, quantity);
    notifyListeners();
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
