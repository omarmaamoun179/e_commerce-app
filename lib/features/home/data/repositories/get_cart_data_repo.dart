import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/get_cart_ds.dart';
import 'package:e_commerce/features/home/domain/entities/get_carts_entity/get_carts_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_cart.dart';

class GetCartsDataRepo implements GetCartsDomainRepo {
  CartsDataSource cartsDataSource;
  GetCartsDataRepo(this.cartsDataSource);
  @override
  Future<Either<Falirues, GetCartsEntity>> getCarts() {
    return cartsDataSource.getCarts();
  }
  



}
