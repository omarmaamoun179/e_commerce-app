import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/user_entity/user_entity.dart';

abstract class GetUserDomainRepo {
  Future<Either<Falirues, UserEntity>> getUserData();
}
