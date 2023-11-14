import 'data.dart';

class GetCartEntity {
  bool? status;
  dynamic message;
  CartDataEntity? data;

  GetCartEntity({this.status, this.message, this.data});

  factory GetCartEntity.fromJson(Map<String, dynamic> json) => GetCartEntity(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : CartDataEntity.fromJson(json['data'] as Map<String, dynamic>),
      );
}
