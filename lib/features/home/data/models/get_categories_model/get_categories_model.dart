import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity.dart';

class GetCategoriesModel extends GetCategoriesEntity {
  int? results;
  Metadata? metadata;

  GetCategoriesModel({this.results, this.metadata, super.data});

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) {
    return GetCategoriesModel(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => DatumCategoriesEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Datum extends DatumCategoriesEntity {
  Datum({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentPage: json['currentPage'] as int?,
        numberOfPages: json['numberOfPages'] as int?,
        limit: json['limit'] as int?,
      );
}
