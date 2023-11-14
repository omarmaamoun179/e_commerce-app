import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_pints.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/features/cart/data/models/get_cart_model/get_cart_model.dart';

abstract class GetCartDataSource {
  Future<Either<Falirues, GetCartModel>> getCart();
  Future<Either<Falirues, GetCartModel>> deleteCart(int id);
}

class RemoteGetCartDataSource extends GetCartDataSource {
  @override
  Future<Either<Falirues, GetCartModel>> getCart() async {
    try {
      Response response =
          await DioHelper.getData('${Constant.baseUrl}${EndPoints.cart}');
      if (response.statusCode == 200) {
        GetCartModel model = GetCartModel.fromJson(response.data);
        return Right(model);
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
    return Left(RemoteServerFailure('error'));
  }

  @override
  Future<Either<Falirues, GetCartModel>> deleteCart(int id) async {
    Dio dio = Dio();
    try {
      Response response =
          await dio.delete('${Constant.baseUrl}${EndPoints.cart}/$id');
      dio.options.headers = {
        "Content-Type": "application/json",
        "lang": "ar",
        "Authorization": Constant.token
      };
      if (response.statusCode == 200) {
        GetCartModel model = GetCartModel.fromJson(response.data);
        return Right(model);
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
    return Left(RemoteServerFailure('error'));
  }
}
