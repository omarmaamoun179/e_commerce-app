import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/get_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repositories/get_cart_domain_repo.dart';

class GetCartUseCase {
  GetCartDomainRepo getCartDomainRepo;
  GetCartUseCase(this.getCartDomainRepo);
  Future<Either<Falirues, GetCartEntity>> call() {
    return getCartDomainRepo.getCart();
  }

  Future<Either<Falirues, GetCartEntity>> deleteCart(int id) {
    return getCartDomainRepo.deleteCart(id);
  }
}
