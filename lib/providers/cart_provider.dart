import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/item.dart';

class CartProvider with ChangeNotifier {
  final List<Item> _cartItems = [];

  List<Item> get cartItems => _cartItems;

  void addToCart(Product product) {
    // Kiểm tra xem sản phẩm đã có trong giỏ chưa
    final existingItem = _cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => Item(product: product, quantity: 0),
    );

    if (_cartItems.contains(existingItem)) {
      existingItem.incrementQuantity();
    } else {
      _cartItems.add(Item(product: product));
    }

    notifyListeners();
  }

  void removeFromCart(Item item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (total, item) => total + item.totalPrice);
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void increaseQuantity(Item item) {
    item.incrementQuantity();
    notifyListeners();
  }

  void decreaseQuantity(Item item) {
    item.decrementQuantity();
    notifyListeners();
  }
}
