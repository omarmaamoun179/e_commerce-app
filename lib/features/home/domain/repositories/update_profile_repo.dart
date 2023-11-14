import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/update_data.dart';
import 'package:e_commerce/features/home/domain/entities/update_user_entity/update_user_entity.dart';
import 'package:e_commerce/features/home/domain/entities/user_entity/user_entity.dart';

abstract class UpdateProfileDomainRepo {
  Future<Either<Falirues, UpdateUserEntity>> updateProfile(UpdateData data);
}
