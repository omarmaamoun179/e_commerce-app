import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_pints.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/features/home/data/models/get_categories_model/get_categories_model/get_categories_model.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_entity.dart';

abstract class GetCategoriesDataSource {
  Future<Either<Falirues, GetCategoriesModel>> getCategories();
}

class GetCategoriesRemote implements GetCategoriesDataSource {
  @override
  Future<Either<Falirues, GetCategoriesModel>> getCategories() async {
    try {
      Response response =
          await DioHelper.getData('${Constant.baseUrl}${EndPoints.categories}');
      if (response.statusCode == 200) {
        GetCategoriesModel model = GetCategoriesModel.fromJson(response.data);
        print(response.data);
        return Right(model);
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
    return left(RemoteServerFailure('error'));
  }
}

class GetCategoriesLocal implements GetCategoriesDataSource {
  @override
  Future<Either<Falirues, GetCategoriesModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
abstract class GetCategoriesDetailsDataSource {
  Future<Either<Falirues, ProductModel>> getCategoriesDetails(int id);
}

class GetCategoriesDetailsRemote implements GetCategoriesDetailsDataSource {
  @override
  Future<Either<Falirues, ProductModel>> getCategoriesDetails(int id) async {
    try {
      Response response =
          await DioHelper.getData('${Constant.baseUrl}${EndPoints.categories}/$id');
      if (response.statusCode == 200) {
       ProductModel model = ProductModel.fromJson(response.data);
        print(response.data);
        return Right(model);
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
    return left(RemoteServerFailure('error'));
  }
}

