import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> items = [];

  List<Product> get itemss => items;

  void addItem(Product product) {
    items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }

  double get totalPrice => items.fold(0, (sum, item) => sum + item.price);
}
