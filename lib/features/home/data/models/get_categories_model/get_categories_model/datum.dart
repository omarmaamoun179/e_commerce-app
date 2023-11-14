import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity/datum.dart';

class DatumModel extends DatumCategoriesEntity {
 

  DatumModel({super.id, super.name, super.image});

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

}
