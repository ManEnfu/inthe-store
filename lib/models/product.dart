class Product {
  Product({
    required this.id,
    required this.name,
    this.description = "",
    required this.price,
    this.image = "",
  });

  String id;
  String name;
  String description;
  int price;
  String image;
}
