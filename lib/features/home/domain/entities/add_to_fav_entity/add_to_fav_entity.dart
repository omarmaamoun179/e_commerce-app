import 'data.dart';

class AddToFavEntity {
  bool? status;
  String? message;
  DataAddToFav? data;

  AddToFavEntity({this.status, this.message, this.data});

  factory AddToFavEntity.fromJson(Map<String, dynamic> json) {
    return AddToFavEntity(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataAddToFav.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
