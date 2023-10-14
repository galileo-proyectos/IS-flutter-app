class ModelAisle {
  final int id;
  final String name;

  ModelAisle({
    required this.id,
    required this.name
  });

  ModelAisle.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'];

  @override
  String toString () => 'Aisle( $id, $name )';
}
