import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_cart/add_to_cart.dart';

abstract class AddToCartDomainRepo {
  Future<Either<Falirues, AddToCartEntity>> addToCart(int id);
}