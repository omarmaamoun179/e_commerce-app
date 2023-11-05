import 'package:e_commerce/features/home/domain/entities/fav_entity/datum.dart';

import 'product.dart';

class DatumFavModel extends DatumFavEntity {
  DatumFavModel({super.id, super.product});

  factory DatumFavModel.fromJson(Map<String, dynamic> json) => DatumFavModel(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };
}
