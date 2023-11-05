import 'package:e_commerce/features/home/domain/entities/add_to_cart/product.dart';

class AddToCartProductModel extends AddToCartProduct {

  AddToCartProductModel({
    super.id,
    super.price,
    super.oldPrice,
    super.discount,
    super.image,
    super.name,
    super.description,
  });

  factory AddToCartProductModel.fromJson(Map<String, dynamic> json) => AddToCartProductModel(
        id: json['id'] as int?,
        price: json['price'] as int?,
        oldPrice: json['old_price'] as int?,
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
      };
}
