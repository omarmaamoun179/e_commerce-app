import 'package:e_commerce/features/home/domain/entities/user_entity/data.dart';

class UserDataModel extends UserDataEntity {
  UserDataModel({
    super.id,
    super.name,
    super.email,
    super.phone,
    super.image,
    super.points,
    super.credit,
    super.token,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        points: json['points'] as int?,
        credit: json['credit'] as int?,
        token: json['token'] as String?,
      );
}
