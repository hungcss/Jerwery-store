class Product {
  final String id;
  final String name;
  final String type;
  final String material;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.type,
    required this.material,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      material: json['material'],
      price: json['price'].toDouble(),
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
}
