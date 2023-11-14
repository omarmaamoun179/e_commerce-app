import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';

abstract class AddToCartDomainRepo {
  Future<Either<Falirues, AddToCartEntity>> addToCart(int product_id);
}
