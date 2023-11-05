import 'package:equatable/equatable.dart';

class DatumPrandsEntity extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const DatumPrandsEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory DatumPrandsEntity.fromJson(Map<String, dynamic> json) =>
      DatumPrandsEntity(
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

  @override
  List<Object?> get props {
    return [
      id,
      name,
      slug,
      image,
      createdAt,
      updatedAt,
    ];
  }
}
