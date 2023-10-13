class ModelCategory {
   final int id;
   final String name;
   final String imageURL;

  ModelCategory({
    required this.id,
    required this.name,
    required this.imageURL
  });

  ModelCategory.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    imageURL = json['imageURL'];

  @override
  String toString () => '( $id, $name, $imageURL )';
}
