import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/get_cart_entity.dart';

abstract class GetCartDomainRepo {
  Future<Either<Falirues, GetCartEntity>> getCart();
  Future<Either<Falirues, GetCartEntity>> deleteCart(int id);
}
