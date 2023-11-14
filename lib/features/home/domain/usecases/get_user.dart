import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/user_entity/user_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_user_domain_repo.dart';

class GetUserUseCase {
  GetUserDomainRepo getUserDomainRepo;
  GetUserUseCase(this.getUserDomainRepo);
  Future<Either<Falirues, UserEntity>> call() {
    return getUserDomainRepo.getUserData();
  }
}
