class ModelPromotion {
  final int id;
  final String name;
  final String description;
  final String couponCode;
  final String urlImage;

  ModelPromotion(this.id, this.name, this.description, this.couponCode, this.urlImage);

  ModelPromotion.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        description = json['description'],
        couponCode = json['couponCode'],
        urlImage = json['urlImage'];

  @override
  String toString () => 'Promo( $id, $name, $urlImage )';
}
