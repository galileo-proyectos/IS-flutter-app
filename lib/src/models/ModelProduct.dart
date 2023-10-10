class ModelProduct {
  ModelProduct({
    required this.name,
    required this.price,
    required this.description,
    required this.aisleId,
    this.imageURL
  });

  final String name;
  final double price;
  final String description;
  final int aisleId;
  final String? imageURL;

  @override
  String toString (){
    return "Q"+ this.price.toString();
  }
}
