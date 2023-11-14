import 'package:e_commerce/features/home/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';

import 'data.dart';

class AddToCartModel extends AddToCartEntity {
  AddToCartModel({super.status, super.message, super.data});

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddToCartDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
