import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app/src/models/ModelCategory.dart';
import 'package:multi_screen_app/src/models/ModelCategoryList.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';

class CubitCategoryList extends Cubit<ModelCategoryList> {
  CubitCategoryList(): super(ModelCategoryList());

  List<ModelCategory> getCategoryList () => state.categoryList;
  void setCategoryList (List<ModelCategory> list) {
    state.categoryList = list;
  }

  List<ModelProduct> getProductList () => state.lastProductList;
  void setProductList (List<ModelProduct> list) {
    state.lastProductList = list;
  }

  String getNameFilter () => state.lastNameFilter;
  void setNameFilter (String name) {
    state.lastNameFilter = name;
  }

  ModelProduct? getSelectedProduct () => state.selectedProduct;
  void setSelectedProduct (ModelProduct product) {
    state.selectedProduct = product;
  }
}
