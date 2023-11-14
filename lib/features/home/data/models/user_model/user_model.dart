import 'package:e_commerce/features/home/domain/entities/user_entity/user_entity.dart';

import 'data.dart';

class UserModel extends UserEntity {
  UserModel({super.status, super.message, super.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : UserDataModel.fromJson(json['data'] as Map<String, dynamic>),
      );
}
