import 'package:e_commerce/features/home/domain/entities/product_entity/datum.dart';

class DatumProdcutModel extends DatumProdcutEntity {
  DatumProdcutModel({
    super.id,
    super.price,
    super.oldPrice,
    super.discount,
    super.image,
    super.name,
    super.description,
    super.images,
    super.inFavorites,
    super.inCart,
  });

  factory DatumProdcutModel.fromJson(Map<String, dynamic> json) =>
      DatumProdcutModel(
        id: json['id'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        oldPrice: (json['old_price'] as num?)?.toDouble(),
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );
}
