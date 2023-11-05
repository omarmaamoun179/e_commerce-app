import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/add_to_cart_ds.dart';
import 'package:e_commerce/features/home/data/models/add_to_cart_model/add_to_cart_model.dart';
import 'package:e_commerce/features/home/domain/repositories/add_to_cart_domain_repo.dart';

class AddToCartDataRepo implements AddToCartDomainRepo {
  AddToCartDataSource addToCartDataSource;
  AddToCartDataRepo(this.addToCartDataSource);
  @override
  Future<Either<Falirues, AddToCartModel>> addToCart(int id) {
    return addToCartDataSource.addToCart(id);
  }
}
