import 'package:equatable/equatable.dart';

class DatumCategoriesEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  const DatumCategoriesEntity({this.id, this.name, this.image});

  factory DatumCategoriesEntity.fromJson(Map<String, dynamic> json) =>
      DatumCategoriesEntity(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };

  @override
  List<Object?> get props => [id, name, image];
}
