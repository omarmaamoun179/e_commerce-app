import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/get_categories_data.dart';
import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_categories_repo.dart';

class GetCategoriesDataRepo implements GetCategroirsDomainRepo {
  GetCategoriesDataSource getCategoriesDataSource;
  GetCategoriesDataRepo(this.getCategoriesDataSource);
  @override
  Future<Either<Falirues, GetCategoriesEntity>> getCategiories() {
    return getCategoriesDataSource.getCategories();
  }
}
