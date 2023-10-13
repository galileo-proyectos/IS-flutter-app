class ModelPromotion {
  final int id;
  final String name;
  final String description;
  final String couponCode;
  final String imageURL;

  ModelPromotion.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        description = json['description'],
        couponCode = json['couponCode'],
        imageURL = json['imageURL'];

  @override
  String toString () => 'Promo( $id, $name, $imageURL )';
}
