import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app/src/models/ModelCart.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';

class CubitCart extends Cubit<ModelCart> {
  CubitCart() : super(ModelCart());

  ModelCart getCart () {
    return state;
  }

  void addProduct (ModelProduct product, double qty) {
    state.details.add(ModelCartDetail(product, qty));
  }
}
