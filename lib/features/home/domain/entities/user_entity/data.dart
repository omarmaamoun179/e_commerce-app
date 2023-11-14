class UserDataEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserDataEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  factory UserDataEntity.fromJson(Map<String, dynamic> json) => UserDataEntity(
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
