import 'cart_item.dart';

class CartDataEntity {
  List<CartItem>? cartItems;

  CartDataEntity({
    this.cartItems,
  });

  factory CartDataEntity.fromJson(Map<String, dynamic> json) => CartDataEntity(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
