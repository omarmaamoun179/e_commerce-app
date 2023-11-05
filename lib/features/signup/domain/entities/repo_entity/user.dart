import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;

  const UserEntity({
    this.name,
    this.email,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  @override
  List<Object?> get props => [
        name,
        email,
      ];
}
