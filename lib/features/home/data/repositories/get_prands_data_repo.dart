import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/get_prand_ds.dart';
import 'package:e_commerce/features/home/domain/entities/get_prands/get_prands.dart';
import 'package:e_commerce/features/home/domain/repositories/get_prands_repo.dart';

class GetPrandsDataRepo implements GetPrandsDomainRepo {
  GetPrandsDataSorce getPrandsDataSource;
  GetPrandsDataRepo(this.getPrandsDataSource);
  @override
  Future<Either<Falirues, GetPrandsEntity>> getPrands() {
    return getPrandsDataSource.getPrands();
  }
}
