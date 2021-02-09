
class ProductFavourite {
  int id;

  ProductFavourite({
    this.id,
  });

  ProductFavourite.fromJson(Map<String , dynamic> parsedJson) {
    id = parsedJson['id'];

  }

  Map<String, dynamic> toMap() {
    return <String , dynamic>{
      'id' : id,
    };
  }
}

