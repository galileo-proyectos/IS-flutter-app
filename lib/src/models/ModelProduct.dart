import 'dart:ffi';

class ModelProduct {
  ModelProduct.fromJson(Map<String, dynamic> json) :
        _code = json['code'],
        _name = json['name'],
        _description = json['description'],
        _price = json['price'].toDouble(),
        _stock = json['stock'].toDouble(),
        _imageURL = json['imageURL'],
        _brandId = json['brandId'],
        _aisleId = json['aisleId'];

  final String _code;
  final String _name;
  final String? _description;
  final double _price;
  final double _stock;
  final String? _imageURL;
  final int _brandId;
  final int _aisleId;

  String get code => _code;
  String get name => _name;
  String? get description => _description;
  double get price => _price;
  double get stock => _stock;
  String? get imageURL => _imageURL;
  int get brandId => _brandId;
  int get aisleId => _aisleId;

  @override
  String toString () => '($_name:Q$_price)';
}
