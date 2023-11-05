import 'package:e_commerce/features/home/domain/entities/get_prands/datum.dart';

class DatumPrands extends DatumPrandsEntity {
  DatumPrands({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  factory DatumPrands.fromJson(Map<String, dynamic> json) => DatumPrands(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );
}
