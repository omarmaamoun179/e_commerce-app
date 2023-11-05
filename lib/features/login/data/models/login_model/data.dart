import 'package:e_commerce/features/login/domain/entities/login_entity/data.dart';

class DataLoginModel extends DataLoginEntity {
  DataLoginModel({
    super.id,
    super.name,
    super.email,
    super.phone,
    super.image,
    super.token,
  });

  factory DataLoginModel.fromJson(Map<String, dynamic> json) => DataLoginModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        token: json['token'] as String?,
      );
}
