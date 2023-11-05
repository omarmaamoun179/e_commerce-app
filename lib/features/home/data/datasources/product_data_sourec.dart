import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_entity.dart';

abstract class ProductDataSource {
  Future<Either<Falirues, ProductModel>> getProduct();
}

class RemoteProductDataSource implements ProductDataSource {
  @override
  Future<Either<Falirues, ProductModel>> getProduct() async {
    try {
      Response response = await DioHelper.getData(
        'https://student.valuxapps.com/api/products',
      );
      if (response.statusCode == 200) {
        ProductModel model = ProductModel.fromJson(response.data);

        return Right(model);
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
      // TODO
    }
    return left(RemoteServerFailure('error'));
  }
}

class LocalProductDataSource implements ProductDataSource {
  @override
  Future<Either<Falirues, ProductModel>> getProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
