import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_cart/add_to_cart.dart';
import 'package:e_commerce/features/home/domain/repositories/add_to_cart_domain_repo.dart';

class AddToCartUseCase {
  AddToCartDomainRepo addToCartDomainRepo;
  AddToCartUseCase(
    this.addToCartDomainRepo,
  );
  Future<Either<Falirues, AddToCartEntity>> addToCart(int id) {
    return addToCartDomainRepo.addToCart(id);
  }
}
