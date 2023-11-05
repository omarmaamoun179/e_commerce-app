import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_pints.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/features/home/data/models/carts_model/carts_model.dart';

abstract class CartsDataSource {
  Future<Either<Falirues, CartsModel>> getCarts();
}

class RemoteCartsDataSource implements CartsDataSource {
  @override
  Future<Either<Falirues, CartsModel>> getCarts() async {
    try {
      Response response =
          await DioHelper.getData('${Constant.baseUrl}${EndPoints.cart}');
      if (response.statusCode == 200) {
        CartsModel model = CartsModel.fromJson(response.data);
        return Right(model);
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
    return left(RemoteServerFailure('error'));
  }


}
