import 'data.dart';

class FavEntity {
  bool? status;
  dynamic message;
  DataFavEntity? data;

  FavEntity({this.status, this.message, this.data});

  factory FavEntity.fromJson(Map<String, dynamic> json) => FavEntity(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : DataFavEntity.fromJson(json['data'] as Map<String, dynamic>),
      );
}
