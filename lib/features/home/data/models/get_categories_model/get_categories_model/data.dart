import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity/data.dart';

import 'datum.dart';

class Data extends DataCategorieEntity {


  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DatumModel.fromJson(e as Map<String, dynamic>))
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


}
