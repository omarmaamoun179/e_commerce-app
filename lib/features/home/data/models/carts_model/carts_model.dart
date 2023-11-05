import 'package:e_commerce/features/home/domain/entities/get_carts_entity/get_carts_entity.dart';

import 'data.dart';

class CartsModel extends GetCartsEntity {
  CartsModel({super.status, super.message, super.data});

  factory CartsModel.fromJson(Map<String, dynamic> json) => CartsModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : DataCarrtsModel.fromJson(json['data'] as Map<String, dynamic>),
      );
}
