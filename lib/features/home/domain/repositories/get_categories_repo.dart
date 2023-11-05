import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity.dart';

abstract class GetCategroirsDomainRepo {
  Future<Either<Falirues, GetCategoriesEntity>> getCategiories();
}
