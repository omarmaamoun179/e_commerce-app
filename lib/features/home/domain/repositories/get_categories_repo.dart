import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity/get_categories_entity.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity/product_entity.dart';

abstract class GetCategroirsDomainRepo {
  Future<Either<Falirues, GetCategoriesEntity>> getCategiories();
}
abstract class GetCategroirsDetailsDomainRepo {
  Future<Either<Falirues, ProductEntity>> getCategioriesDetails(int id);
}
