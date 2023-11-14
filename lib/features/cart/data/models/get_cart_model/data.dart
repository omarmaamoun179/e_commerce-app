import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/data.dart';

import 'cart_item.dart';

class CartDataModel extends CartDataEntity {
  CartDataModel({
    super.cartItems,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) => CartDataModel(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
