import 'package:e_commerce/features/home/domain/entities/add_to_fav_entity/add_to_fav_entity.dart';

import 'data.dart';

class AddToFavModel extends AddToFavEntity {
  AddToFavModel({super.status, super.message, super.data});

  factory AddToFavModel.fromJson(Map<String, dynamic> json) => AddToFavModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : DataAddToFavModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
