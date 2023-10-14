class ModelBrand {
  final int id;
  final String name;

  ModelBrand({
    required this.id,
    required this.name
  });

  ModelBrand.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'];

  @override
  String toString () => 'Aisle( $id, $name )';
}
