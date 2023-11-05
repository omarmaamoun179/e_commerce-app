import 'product.dart';

class DataAddToFav {
  int? id;
  ProductAddToFav? product;

  DataAddToFav({this.id, this.product});

  factory DataAddToFav.fromJson(Map<String, dynamic> json) => DataAddToFav(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : ProductAddToFav.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };
}
