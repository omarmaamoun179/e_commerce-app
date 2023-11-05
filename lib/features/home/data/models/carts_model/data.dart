import 'package:e_commerce/features/home/domain/entities/get_carts_entity/data.dart';

import 'cart_item.dart';

class DataCarrtsModel extends DataCartEntity {
  const DataCarrtsModel({super.cartItems, super.subTotal, super.total});

  factory DataCarrtsModel.fromJson(Map<String, dynamic> json) =>
      DataCarrtsModel(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
