import 'package:e_commerce/features/home/domain/entities/add_to_fav_entity/data.dart';

import 'product.dart';

class DataAddToFavModel extends DataAddToFav {
  DataAddToFavModel({super.id, super.product});

  factory DataAddToFavModel.fromJson(Map<String, dynamic> json) =>
      DataAddToFavModel(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : ProductAddToFavModel.fromJson(
                json['product'] as Map<String, dynamic>),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };
}
