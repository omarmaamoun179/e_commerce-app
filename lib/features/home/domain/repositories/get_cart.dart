import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/get_carts_entity/get_carts_entity.dart';

abstract class GetCartsDomainRepo {
  Future<Either<Falirues, GetCartsEntity>> getCarts();
}
