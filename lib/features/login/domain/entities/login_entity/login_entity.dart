import 'package:equatable/equatable.dart';

import 'data.dart';

class LoginEntity extends Equatable {
  final bool? status;
  final String? message;
  final DataLoginEntity? data;

  const LoginEntity({this.status, this.message, this.data});

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : DataLoginEntity.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
