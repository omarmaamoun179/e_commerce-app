import 'package:equatable/equatable.dart';

class DataLoginEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;

  final String? token;

  const DataLoginEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
  });

  factory DataLoginEntity.fromJson(Map<String, dynamic> json) =>
      DataLoginEntity(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'token': token,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      image,
      token,
    ];
  }
}
