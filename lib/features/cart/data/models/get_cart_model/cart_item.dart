import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/cart_item.dart';

import 'product.dart';

class CartItemModel extends CartItem {
  CartItemModel({super.quantity, super.product});

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      );
}
