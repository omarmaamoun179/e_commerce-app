import 'package:equatable/equatable.dart';

import 'data.dart';

class ProductEntity extends Equatable {
  final bool? status;
  final dynamic message;
  final DataProductEntity? data;

  const ProductEntity({this.status, this.message, this.data});

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : DataProductEntity.fromJson(json['data'] as Map<String, dynamic>),
      );

  @override
  List<Object?> get props => [status, message, data];
}
