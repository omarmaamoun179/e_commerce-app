import 'package:e_commerce/features/home/domain/entities/update_user_entity/data.dart';

class UpdateUserDataModel extends UpdateUserDataEntity {
  UpdateUserDataModel({
    super.id,
    super.name,
    super.email,
    super.phone,
    super.image,
    super.points,
    super.credit,
    super.token,
  });

  factory UpdateUserDataModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserDataModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        points: json['points'] as int?,
        credit: json['credit'] as int?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'points': points,
        'credit': credit,
        'token': token,
      };
}
