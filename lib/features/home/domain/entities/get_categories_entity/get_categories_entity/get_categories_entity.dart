import 'package:equatable/equatable.dart';

import 'data.dart';

class GetCategoriesEntity extends Equatable {
  final bool? status;
  final dynamic message;
  final DataCategorieEntity? data;

  const GetCategoriesEntity({this.status, this.message, this.data});

  factory GetCategoriesEntity.fromJson(Map<String, dynamic> json) {
    return GetCategoriesEntity(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      data: json['data'] == null
          ? null
          : DataCategorieEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
