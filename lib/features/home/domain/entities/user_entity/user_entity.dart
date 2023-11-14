import 'data.dart';

class UserEntity {
  bool? status;
  dynamic message;
  UserDataEntity? data;

  UserEntity({this.status, this.message, this.data});

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : UserDataEntity.fromJson(json['data'] as Map<String, dynamic>),
      );
}
