import 'package:dio/dio.dart';
import '../models/product.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<Product>> fetchProducts() async {
    const apiUrl =
        'https://world.openfoodfacts.org/api/v2/search?fields=product_name,brands,code,image_url&page_size=1000';

    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final List products = data['products'] ?? [];
        return products.map((item) => Product.fromOffJson(item)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
