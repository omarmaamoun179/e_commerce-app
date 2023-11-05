import 'package:e_commerce/features/home/domain/entities/add_to_fav_entity/product.dart';

class ProductAddToFavModel extends ProductAddToFav {
  ProductAddToFavModel(
      {super.id, super.price, super.oldPrice, super.discount, super.image});

  factory ProductAddToFavModel.fromJson(Map<String, dynamic> json) =>
      ProductAddToFavModel(
        id: json['id'] as int?,
        price: json['price'] as int?,
        oldPrice: json['old_price'] as int?,
        discount: json['discount'] as int?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
      };
}
