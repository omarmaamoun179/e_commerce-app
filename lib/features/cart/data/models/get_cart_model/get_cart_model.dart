import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/get_cart_entity.dart';

import 'data.dart';

class GetCartModel extends GetCartEntity {
  GetCartModel({super.status, super.message, super.data});

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : CartDataModel.fromJson(json['data'] as Map<String, dynamic>),
      );
}
