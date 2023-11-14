import 'product.dart';

class CartItem {
  // int? id;
  int? quantity;
  Product? product;

  CartItem({this.quantity, this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );
}
