import 'package:e_commerce/features/signup/domain/entities/repo_entity/repo_entity.dart';

import 'user.dart';

class SingupModel extends RepoEntity {
  String? message;

  SingupModel({this.message, super.user, super.token});

  factory SingupModel.fromJson(Map<String, dynamic> json) => SingupModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );
}
