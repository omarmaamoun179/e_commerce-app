import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetPrandsEntity extends Equatable {
  final List<DatumPrandsEntity>? data;

  const GetPrandsEntity({this.data});

  factory GetPrandsEntity.fromJson(Map<String, dynamic> json) =>
      GetPrandsEntity(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DatumPrandsEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  List<Object?> get props => [data];
}
