class GetCategoriesEntity {
  List<DatumCategoriesEntity>? data;

  GetCategoriesEntity({this.data});

  factory GetCategoriesEntity.fromJson(Map<String, dynamic> json) {
    return GetCategoriesEntity(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => DatumCategoriesEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DatumCategoriesEntity {
  String? id;
  String? name;
  String? slug;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumCategoriesEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory DatumCategoriesEntity.fromJson(Map<String, dynamic> json) =>
      DatumCategoriesEntity(
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
