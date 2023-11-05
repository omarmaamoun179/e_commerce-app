import 'package:e_commerce/features/home/domain/entities/product_entity/product_entity.dart';

import 'data.dart';

class ProductModel extends ProductEntity {
  const ProductModel({super.status, super.message, super.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : DataProductModel.fromJson(json['data'] as Map<String, dynamic>),
      );
}
