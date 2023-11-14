import 'data.dart';

class UpdateUserEntity {
  bool? status;
  String? message;
  UpdateUserDataEntity? data;

  UpdateUserEntity({this.status, this.message, this.data});

  factory UpdateUserEntity.fromJson(Map<String, dynamic> json) {
    return UpdateUserEntity(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UpdateUserDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
