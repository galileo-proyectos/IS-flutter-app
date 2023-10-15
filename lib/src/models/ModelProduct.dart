import 'package:multi_screen_app/src/models/ModelAisle.dart';
import 'package:multi_screen_app/src/models/ModelBrand.dart';
import 'package:multi_screen_app/src/models/ModelCategory.dart';

class ModelProduct {
  ModelProduct.fromJson(Map<String, dynamic> json) :
        _code = json['code'],
        _name = json['name'],
        _description = json['description'],
        _price = json['price'].toDouble(),
        _stock = json['stock'].toDouble(),
        _imageURL = json['imageURL'],
        _category = ModelCategory.fromJson(json['category']),
        _aisle = ModelAisle.fromJson(json['aisle']),
        _brand = ModelBrand.fromJson(json['brand']);

  final String _code;
  final String _name;
  final String _description;
  final double _price;
  final double _stock;
  final String _imageURL;
  final ModelCategory _category;
  final ModelAisle _aisle;
  final ModelBrand _brand;


  String get code => _code;
  String get name => _name;
  String get description => _description;
  double get price => _price;
  double get stock => _stock;
  String get imageURL => _imageURL;
  ModelCategory get category => _category;
  ModelAisle get aisle => _aisle;
  ModelBrand get brand => _brand;

  @override
  String toString () => '($_name:Q$_price)';
}
