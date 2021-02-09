
class Product {
  int id;
  int qty;
  String imageUrl;
  String name;
  int price;
  String description;
  int score;

  Product({
    this.id,
    this.qty,
    this.imageUrl,
    this.name,
    this.price,
    this.description,
    this.score,
  });

  Product.fromJson(Map<String , dynamic> parsedJson) {
    id = parsedJson['id'];
    price = parsedJson['price'];
    qty = parsedJson['qty'];
    imageUrl = parsedJson['imageUrl'];
    description = parsedJson['description'];
    score = parsedJson['score'];
    name = parsedJson['name'];
  }

  Map<String, dynamic> toMap() {

    return <String , dynamic>{
      'id' : id,
    };
  }
}

