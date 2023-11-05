import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/domain/entities/login_data.dart';

import '../entities/login_entity/login_entity.dart';

abstract class LoginDomainRepo {
  Future<Either<Falirues, LoginEntity>> login(LoginData loginData);
}
