import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:e_commerce/features/login/data/models/login_model/login_model.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/login_data.dart';

abstract class LoginDataSource {
  Future<Either<Falirues, LoginModel>> login(LoginData loginData);
}

class RemoteLoginDataSource implements LoginDataSource {
  Dio dio = Dio();
  @override
  Future<Either<Falirues, LoginModel>> login(LoginData loginData) async {
    try {
      Response response =
          await dio.post('https://student.valuxapps.com/api/login', data: {
        "email": loginData.email,
        "password": loginData.password,
      });

      LoginModel loginModel = LoginModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return Right(loginModel);
      }
      return left(RemoteServerFailure('error'));
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
  }
}

class LocalLoginDataSource implements LoginDataSource {
  @override
  Future<Either<Falirues, LoginModel>> login(LoginData loginData) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
