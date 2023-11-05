import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_pints.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/features/signup/data/models/singup_model/singup_model.dart';
import 'package:e_commerce/features/signup/domain/entities/register_data.dart';

import '../../../../core/error/failures.dart';

abstract class SignUpDataSource {
  Future<Either<Falirues, SingupModel>> singup(SingUpData singUpData);
}

class RemoteSignUpDataSource implements SignUpDataSource {
  Dio dio = Dio();
  @override
  Future<Either<Falirues, SingupModel>> singup(singUpData) async {
    try {
      Response response =
          await dio.post('https://student.valuxapps.com/api/register', data: {
        "name": singUpData.name,
        "email": singUpData.email,
        "password": singUpData.password,
        "rePassword": singUpData.passwordConfirmation,
        "phone": singUpData.phone,
      });
      SingupModel singupModel = SingupModel.fromJson(response.data);
      print(response.data.toString());
      return Right(singupModel);
    } on Exception catch (e) {
      print(e.toString());
      return Left(RemoteServerFailure(e.toString()));
    }
  }
}

class LocalSignUpDataSource implements SignUpDataSource {
  @override
  Future<Either<Falirues, SingupModel>> singup(singUpData) {
    // TODO: implement singup
    throw UnimplementedError();
  }
}
