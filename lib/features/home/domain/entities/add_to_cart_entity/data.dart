import 'product.dart';

class AddToCartDataEntity {
  int? id;
  int? quantity;
  AddToCartProductEntity? product;

  AddToCartDataEntity({this.id, this.quantity, this.product});

  factory AddToCartDataEntity.fromJson(Map<String, dynamic> json) =>
      AddToCartDataEntity(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : AddToCartProductEntity.fromJson(
                json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product?.toJson(),
      };
}
