import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app/src/models/ModelScanner.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';

class CubitScanner extends Cubit<ModelScanner> {
  CubitScanner(): super(ModelScanner());

  void selectProduct (ModelProduct product) {
    state.selectedProduct = product;
  }
}
