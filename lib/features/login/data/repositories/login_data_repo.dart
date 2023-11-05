import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/data/datasources/login_data_source.dart';
import 'package:e_commerce/features/login/domain/entities/login_data.dart';
import 'package:e_commerce/features/login/domain/entities/login_entity/login_entity.dart';
import 'package:e_commerce/features/login/domain/repositories/login_domain_repo.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSource loginDataSource;
  LoginDataRepo(this.loginDataSource);
  @override
  Future<Either<Falirues, LoginEntity>> login(LoginData loginData) {
    return loginDataSource.login(loginData);
  }
}
