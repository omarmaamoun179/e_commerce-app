import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_pints.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/features/home/data/models/add_to_cart_model/add_to_cart_model.dart';

abstract class AddToCartDataSource {
  Future<Either<Falirues, AddToCartModel>> addToCart(int id);
}

class RemoteAddTocartDataSource implements AddToCartDataSource {
  @override
  Future<Either<Falirues, AddToCartModel>> addToCart(int id)  async{
   

    try {
      Response response = await DioHelper.postData(
          '${Constant.baseUrl}${EndPoints.cart}',
          data: {'product_id': id});
      if (response.statusCode == 200) {
       AddToCartModel model = AddToCartModel.fromJson(response.data);
        return Right(model);
      }
    } catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
    return left(RemoteServerFailure('error'));
  }
  }

