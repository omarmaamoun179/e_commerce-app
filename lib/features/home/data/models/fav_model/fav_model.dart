import 'package:e_commerce/features/home/domain/entities/fav_entity/fav_entity.dart';

import 'data.dart';

class FavModel extends FavEntity {
  FavModel({super.status, super.message, super.data});

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : DataFavModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
