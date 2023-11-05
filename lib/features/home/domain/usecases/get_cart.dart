

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/get_carts_entity/get_carts_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_cart.dart';

class CartsUseCase {
  GetCartsDomainRepo getCartsDomainRepo;
  CartsUseCase(
    this.getCartsDomainRepo,
  );
  Future<Either<Falirues, GetCartsEntity>> call() {
    return getCartsDomainRepo.getCarts();
  }

 
}
