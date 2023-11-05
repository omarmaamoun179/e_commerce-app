import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/fav_model/fav_model.dart';

abstract class GetFavDataSource {
  Future<Either<Falirues, FavModel>> getFav();
}

class RemoteGetFav implements GetFavDataSource {
  @override
  Future<Either<Falirues, FavModel>> getFav() async {
    try {
      Response response = await DioHelper.getData(
        'https://student.valuxapps.com/api/favorites',
      );
      print(response.data.toString());
      if (response.statusCode == 200) {
        FavModel model = FavModel.fromJson(response.data);
        return Right(model);
      }
    } on Exception {
      return Left(RemoteServerFailure(
        e.toString(),
      ));
    }
    return Left(RemoteServerFailure('error'));
  }
}
