import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/get_user_ds.dart';
import 'package:e_commerce/features/home/domain/entities/user_entity/user_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_user_domain_repo.dart';
import 'package:e_commerce/features/login/domain/entities/login_entity/login_entity.dart';

class GetUserDataRepo implements GetUserDomainRepo {
  GetUserDataSource getUserDataSource;
  GetUserDataRepo(this.getUserDataSource);

  @override
  Future<Either<Falirues, UserEntity>> getUserData() {
    return getUserDataSource.getUserData();
  }
}
