import 'package:e_commerce/features/home/domain/entities/get_carts_entity/product.dart';

class ProductCartModel extends CartsProductEntity {
  ProductCartModel({
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

  factory ProductCartModel.fromJson(Map<String, dynamic> json) =>
      ProductCartModel(
        id: json['id'] as int?,
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };
}
