import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity/get_categories_entity.dart';

import 'data.dart';

class GetCategoriesModel  extends GetCategoriesEntity{


  GetCategoriesModel({super.status, super.message, super.data});

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) {
    return GetCategoriesModel(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

}
