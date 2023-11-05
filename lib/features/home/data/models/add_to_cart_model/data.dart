import 'package:e_commerce/features/home/domain/entities/add_to_cart/data.dart';

import 'product.dart';

class AddToCartDataModel extends AddToCartData {


  AddToCartDataModel({super.id, super.quantity, super.product});

  factory AddToCartDataModel.fromJson(Map<String, dynamic> json) => AddToCartDataModel(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : AddToCartProductModel.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product?.toJson(),
      };
}
