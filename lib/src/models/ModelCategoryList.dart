import 'package:multi_screen_app/src/models/ModelCategory.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';

class ModelCategoryList {
  ModelCategoryList();

  List<ModelCategory> categoryList = [];
  List<ModelProduct> lastProductList = [];
  String lastNameFilter = '';
  ModelProduct? selectedProduct;
}