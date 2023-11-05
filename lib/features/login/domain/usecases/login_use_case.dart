import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/domain/entities/login_data.dart';
import 'package:e_commerce/features/login/domain/repositories/login_domain_repo.dart';

import '../entities/login_entity/login_entity.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;
  LoginUseCase(this.loginDomainRepo);
  Future<Either<Falirues, LoginEntity>> call(LoginData loginData) {
    return loginDomainRepo.login(loginData);
  }
}
