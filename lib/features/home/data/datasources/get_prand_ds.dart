import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_pints.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/features/home/data/models/get_prands_model/get_prands_model.dart';

abstract class GetPrandsDataSorce {
  Future<Either<Falirues, GetPrandsModel>> getPrands();
}

class RemoteGetPrandsDataSorce implements GetPrandsDataSorce {
  @override
  Future<Either<Falirues, GetPrandsModel>> getPrands() async {
    try {
      Response response = await DioHelper.getData(
          '${Constant.baseUrlRoute}${EndPoints.brands}');
      if (response.statusCode == 200) {
        GetPrandsModel model = GetPrandsModel.fromJson(response.data);
        return Right(model);
      }
    } catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
    return left(RemoteServerFailure('error'));
  }
}

class LocalGetPrandsDataSorce implements GetPrandsDataSorce {
  @override
  Future<Either<Falirues, GetPrandsModel>> getPrands() {
    // TODO: implement getPrands
    throw UnimplementedError();
  }
}
