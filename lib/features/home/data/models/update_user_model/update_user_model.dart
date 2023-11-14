import 'package:e_commerce/features/home/domain/entities/update_user_entity/update_user_entity.dart';

import 'data.dart';

class UpdateUserModel extends UpdateUserEntity {
  UpdateUserModel({super.status, super.message, super.data});

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UpdateUserDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
