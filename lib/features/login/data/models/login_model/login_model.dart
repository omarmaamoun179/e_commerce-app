import 'package:e_commerce/features/login/domain/entities/login_entity/login_entity.dart';

import 'data.dart';

class LoginModel extends LoginEntity {
  LoginModel({super.status, super.message, super.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : DataLoginModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
