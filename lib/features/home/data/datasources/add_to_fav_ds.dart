import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/add_to_fav_model/add_to_fav_model.dart';

abstract class AddToFavDataSource {
  Future<Either<Falirues, AddToFavModel>> addToFav(int productId);
}

class RemoteAddToFav implements AddToFavDataSource {
  @override
  Future<Either<Falirues, AddToFavModel>> addToFav(productId) async {
    try {
      Response response = await DioHelper.postData(data: {
        'product_id': productId,
      }, 'https://student.valuxapps.com/api/favorites');
      print(response.data.toString());
      if (response.statusCode == 200) {
        AddToFavModel model = AddToFavModel.fromJson(response.data);
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
