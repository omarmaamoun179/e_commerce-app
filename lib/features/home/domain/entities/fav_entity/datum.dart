import 'product.dart';

class DatumFavEntity {
  int? id;
  Product? product;

  DatumFavEntity({this.id, this.product});

  factory DatumFavEntity.fromJson(Map<String, dynamic> json) => DatumFavEntity(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };
}
