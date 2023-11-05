import 'data.dart';

class AddToCartEntity {
  bool? status;
  String? message;
  AddToCartData? data;

  AddToCartEntity({this.status, this.message, this.data});

  factory AddToCartEntity.fromJson(Map<String, dynamic> json) =>
      AddToCartEntity(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : AddToCartData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
