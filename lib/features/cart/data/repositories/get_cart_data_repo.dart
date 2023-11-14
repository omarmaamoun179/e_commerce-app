import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/datasources/get_cart_data_source.dart';
import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/get_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repositories/get_cart_domain_repo.dart';

class GetCartDataRepo implements GetCartDomainRepo {
  GetCartDataSource getCartDataSource;
  GetCartDataRepo(this.getCartDataSource);
  @override
  Future<Either<Falirues, GetCartEntity>> getCart() {
    return getCartDataSource.getCart();
  }

  @override
  Future<Either<Falirues, GetCartEntity>> deleteCart(int id) {
    return getCartDataSource.deleteCart(id);
  }
}
