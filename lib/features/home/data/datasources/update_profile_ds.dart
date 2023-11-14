import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/features/home/data/models/update_user_model/update_user_model.dart';
import 'package:e_commerce/features/home/domain/entities/update_data.dart';

abstract class UpdateProfileDs {
  Future<Either<Falirues, UpdateUserModel>> updateProfile(UpdateData data);
}

class RemoteUpdateProfileDs implements UpdateProfileDs {
  @override
  Future<Either<Falirues, UpdateUserModel>> updateProfile(
      UpdateData data) async {
    Dio dio = Dio();
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': Constant.token,
    };
    try {
      Response response = await dio
          .put('https://student.valuxapps.com/api/update-profile', data: {
        "name": data.name,
        "email": data.email,
        "phone": data.phone,
      });
      if (response.statusCode == 200) {
        UpdateUserModel userModel = UpdateUserModel.fromJson(response.data);
        print(response.data.toString());
        return Right(userModel);
      } else {
        return Left(RemoteServerFailure('error'));
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
  }
}
