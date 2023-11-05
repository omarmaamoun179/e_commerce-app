import 'data.dart';

class GetCartsEntity {
  final bool? status;
  final dynamic message;
  final DataCartEntity? data;

  const GetCartsEntity({this.status, this.message, this.data});

  factory GetCartsEntity.fromJson(Map<String, dynamic> json) {
    return GetCartsEntity(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      data: json['data'] == null
          ? null
          : DataCartEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
