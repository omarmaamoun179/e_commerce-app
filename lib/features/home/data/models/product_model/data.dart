import 'package:e_commerce/features/home/domain/entities/product_entity/data.dart';

import 'datum.dart';

class DataProductModel extends DataProductEntity {
  const DataProductModel({
    super.currentPage,
    super.data,
    super.firstPageUrl,
    super.from,
    super.lastPage,
    super.lastPageUrl,
    super.nextPageUrl,
    super.path,
    super.perPage,
    super.prevPageUrl,
    super.to,
    super.total,
  });

  factory DataProductModel.fromJson(Map<String, dynamic> json) =>
      DataProductModel(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DatumProdcutModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl: json['first_page_url'] as String?,
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        lastPageUrl: json['last_page_url'] as String?,
        nextPageUrl: json['next_page_url'] as dynamic,
        path: json['path'] as String?,
        perPage: json['per_page'] as int?,
        prevPageUrl: json['prev_page_url'] as dynamic,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );

  @override
  List<Object?> get props {
    return [
      currentPage,
      data,
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total,
    ];
  }
}
