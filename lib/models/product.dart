class Product {
  final String name;
  final String brand;
  final String imageUrl;
  final String code;
  double price;
  int stock;

  Product({
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.code,
    this.price = 0,
    this.stock = 0,
  });

  factory Product.fromOffJson(Map<String, dynamic> json) {
    return Product(
      name: json['product_name'] ?? 'Unknown',
      brand: json['brands'] ?? '',
      imageUrl: json['image_url'] ?? '',
      code: json['code'] ?? '',
    );
  }
}
