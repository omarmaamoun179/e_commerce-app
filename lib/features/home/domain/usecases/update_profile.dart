import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/update_data.dart';
import 'package:e_commerce/features/home/domain/entities/update_user_entity/update_user_entity.dart';
import 'package:e_commerce/features/home/domain/entities/user_entity/user_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/update_profile_repo.dart';

class UpdateProfileUseCase {
  UpdateProfileDomainRepo updateProfileDomainRepo;
  UpdateProfileUseCase(this.updateProfileDomainRepo);
  Future<Either<Falirues, UpdateUserEntity>> call(UpdateData data) {
    return updateProfileDomainRepo.updateProfile(data);
  }
}
