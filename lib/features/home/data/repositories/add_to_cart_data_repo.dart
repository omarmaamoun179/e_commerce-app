import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/add_to_cart_ds.dart';
import 'package:e_commerce/features/home/data/models/add_to_cart_model/add_to_cart_model.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/add_to_cart_domain_repo.dart';

class AddToCartDataRepo implements AddToCartDomainRepo {
  AddToCartDataSource addToCartDataSource;

  AddToCartDataRepo(this.addToCartDataSource);

  @override
  Future<Either<Falirues, AddToCartEntity>> addToCart(int product_id) {
    return addToCartDataSource.addToCart(product_id);
  }
}
