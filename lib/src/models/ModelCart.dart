import 'package:multi_screen_app/src/models/ModelProduct.dart';

class ModelCartDetail {
  ModelCartDetail(this.product, this.qty);

  final ModelProduct product;
  final double qty;

  @override
  String toString () => '(${product.name}, $qty)';
}

class ModelCart {
  ModelCart();

  List<ModelCartDetail> details = [];
  // [Q] payment method
  // token

  @override
  String toString () => '$details';
}
