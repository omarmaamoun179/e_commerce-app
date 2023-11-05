import 'product.dart';

class CartItem {
  final int? id;
  final int? quantity;
  final CartsProductEntity? product;

  const CartItem({this.id, this.quantity, this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : CartsProductEntity.fromJson(
                json['product'] as Map<String, dynamic>),
      );
}
