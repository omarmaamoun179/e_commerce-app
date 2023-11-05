import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/signup/domain/entities/register_data.dart';

import '../../../../core/error/failures.dart';
import '../entities/repo_entity/repo_entity.dart';

abstract class SignUpDomainRepo {
  Future<Either<Falirues, RepoEntity>> singup(SingUpData singUpData);
}
