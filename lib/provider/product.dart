class Product {
  final String id;
  final String title;
  final String description;
  final String imageurl;
  final String category;

  final double Price;
  final bool isFavourtie = false;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.imageurl,
    required this.Price,
  });
}
