import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) {
      if (item.containsKey('price') && item['price'] != null) {
        final priceValue = item['price'];

        // Ensure value is treated as string and cleaned
        final priceString = priceValue.toString().replaceAll(',', '');
        final price = double.tryParse(priceString);

        if (price != null) {
          return sum + price;
        }
      }

      return sum;
    });
  }
}
