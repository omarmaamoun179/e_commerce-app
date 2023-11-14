import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/get_cart_entity.dart';

abstract class GetCartsDomainRepo {
  Future<Either<Falirues, GetCartEntity>> getCarts();
}
