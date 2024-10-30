import 'product.dart';

class Item {
  final Product product;
  int quantity;

  Item({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
