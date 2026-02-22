import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductsProvider extends ChangeNotifier {
  final service = ApiService();
  List<Product> products = [];
  List<Product> filtered = [];
  bool loading = true;

  List<Product> get productss => filtered;

  Future<void> fetchProducts() async {
    loading = true;
    notifyListeners();
    products = await service.fetchProducts();
    filtered = products;
    loading = false;
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filtered = products;
    } else {
      filtered = products.where((p) => p.name.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }
}
