import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/add_to_cart_domain_repo.dart';

class AddToCartUseCase {
  AddToCartDomainRepo addToCartDomainRepo;
  AddToCartUseCase(this.addToCartDomainRepo);
  Future<Either<Falirues, AddToCartEntity>> call(int product_id) {
    return addToCartDomainRepo.addToCart(product_id);
  }
}
