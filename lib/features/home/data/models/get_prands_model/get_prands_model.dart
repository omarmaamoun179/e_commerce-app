import 'package:e_commerce/features/home/domain/entities/get_prands/get_prands.dart';

import 'datum.dart';

class GetPrandsModel extends GetPrandsEntity {
  const GetPrandsModel({super.data});

  factory GetPrandsModel.fromJson(Map<String, dynamic> json) {
    return GetPrandsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DatumPrands.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
