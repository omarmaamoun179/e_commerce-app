
import 'package:e_commerce/features/home/domain/entities/get_carts_entity/cart_item.dart';

import 'product.dart';

class CartItemModel extends CartItem {
  CartItemModel({super.id, super.quantity, super.product});

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : ProductCartModel.fromJson(
                json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product?.toJson(),
      };
}
