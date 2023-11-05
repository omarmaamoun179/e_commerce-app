import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/get_prands/get_prands.dart';

abstract class GetPrandsDomainRepo {
  Future<Either<Falirues, GetPrandsEntity>> getPrands();
}
