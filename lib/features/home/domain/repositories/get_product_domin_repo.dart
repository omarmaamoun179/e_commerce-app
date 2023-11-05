import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity/product_entity.dart';

abstract class GetProductDomainRepo {
  Future<Either<Falirues, ProductEntity>> getProduct();
}
