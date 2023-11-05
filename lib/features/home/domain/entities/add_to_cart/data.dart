import 'product.dart';

class AddToCartData {
  int? id;
  int? quantity;
  AddToCartProduct? product;

  AddToCartData({this.id, this.quantity, this.product});

  factory AddToCartData.fromJson(Map<String, dynamic> json) => AddToCartData(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : AddToCartProduct.fromJson(
                json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product?.toJson(),
      };
}
