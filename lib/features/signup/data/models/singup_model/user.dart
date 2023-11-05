import '../../../domain/entities/repo_entity/user.dart';

class User extends UserEntity {
  String? role;

  User({super.name, super.email, this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role': role,
      };
}
