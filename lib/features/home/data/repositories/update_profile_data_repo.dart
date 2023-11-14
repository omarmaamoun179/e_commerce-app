import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/update_profile_ds.dart';
import 'package:e_commerce/features/home/domain/entities/update_data.dart';
import 'package:e_commerce/features/home/domain/entities/update_user_entity/update_user_entity.dart';
import 'package:e_commerce/features/home/domain/entities/user_entity/user_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/update_profile_repo.dart';

class UpdateProfileDataRepo implements UpdateProfileDomainRepo {
  UpdateProfileDs updateProfileDs;
  UpdateProfileDataRepo(this.updateProfileDs);
  @override
  Future<Either<Falirues, UpdateUserEntity>> updateProfile(UpdateData data) {
    return updateProfileDs.updateProfile(data);
  }
}
