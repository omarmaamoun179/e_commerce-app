import 'data.dart';

class AddToCartEntity {
  bool? status;
  String? message;
  AddToCartDataEntity? data;

  AddToCartEntity({this.status, this.message, this.data});

  factory AddToCartEntity.fromJson(Map<String, dynamic> json) {
    return AddToCartEntity(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddToCartDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
