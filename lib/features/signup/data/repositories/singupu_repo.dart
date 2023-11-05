import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/signup/data/datasources/singup_data_source.dart';
import 'package:e_commerce/features/signup/domain/entities/register_data.dart';
import 'package:e_commerce/features/signup/domain/entities/repo_entity/repo_entity.dart';
import 'package:e_commerce/features/signup/domain/repositories/repo_domain.dart';

class SingupDateRepo implements SignUpDomainRepo {
  SignUpDataSource signUpDataSource;
  SingupDateRepo(this.signUpDataSource);

  @override
  Future<Either<Falirues, RepoEntity>> singup(SingUpData singUpData) {
    return signUpDataSource.singup(singUpData);
  }
}
