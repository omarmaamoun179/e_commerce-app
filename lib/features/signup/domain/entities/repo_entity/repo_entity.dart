import 'package:equatable/equatable.dart';

import 'user.dart';

class RepoEntity extends Equatable {
  final UserEntity? user;
  final String? token;

  const RepoEntity({this.user, this.token});

  factory RepoEntity.fromJson(Map<String, dynamic> json) => RepoEntity(
        user: json['user'] == null
            ? null
            : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  @override
  List<Object?> get props => [user, token];
}
