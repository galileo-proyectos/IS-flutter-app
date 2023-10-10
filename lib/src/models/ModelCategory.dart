class ModelCategory {
   final int id;
   final String name;
   final String? urlImage;

  ModelCategory({
    required this.id,
    required this.name,
    required this.urlImage
  });

  ModelCategory.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    urlImage = json['urlImage'];

  @override
  String toString () => '( $id, $name, $urlImage )';
}
