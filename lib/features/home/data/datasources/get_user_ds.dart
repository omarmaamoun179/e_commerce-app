import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/user_model/user_model.dart';

abstract class GetUserDataSource {
  Future<Either<Falirues, UserModel>> getUserData();
}

class RemoteGetUserDataSource implements GetUserDataSource {
  @override
  Future<Either<Falirues, UserModel>> getUserData() async {
    try {
      Response response =
          await DioHelper.getData('https://student.valuxapps.com/api/profile');
      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data);
        return Right(userModel);
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
    return Left(RemoteServerFailure('error'));
  }
}
