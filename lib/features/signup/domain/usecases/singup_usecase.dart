import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/signup/domain/entities/register_data.dart';
import 'package:e_commerce/features/signup/domain/entities/repo_entity/repo_entity.dart';
import 'package:e_commerce/features/signup/domain/repositories/repo_domain.dart';

class SingUpUseCase {
  SignUpDomainRepo signUpRepoDomain;

  SingUpUseCase(this.signUpRepoDomain);
  Future<Either<Falirues, RepoEntity>> call(SingUpData singUpData) {
    return signUpRepoDomain.singup(singUpData);
  }
}
