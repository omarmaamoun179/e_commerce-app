import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/add_to_cart_model/add_to_cart_model.dart';

abstract class AddToCartDataSource {
  Future<Either<Falirues, AddToCartModel>> addToCart(int productId);
}

class RemoteAddToCart implements AddToCartDataSource {
  @override
  Future<Either<Falirues, AddToCartModel>> addToCart(productId) async {
    try {
      Response response = await DioHelper.postData(data: {
        'product_id': productId,
      }, 'https://student.valuxapps.com/api/carts');
      print(response.data.toString());
      if (response.statusCode == 200) {
        AddToCartModel model = AddToCartModel.fromJson(response.data);
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
