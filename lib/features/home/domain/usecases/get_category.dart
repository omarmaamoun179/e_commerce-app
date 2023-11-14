// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity/get_categories_entity.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_categories_repo.dart';

class GetCategoriesUseCase {
  GetCategroirsDomainRepo getCategroirsDomainRepo;
  GetCategoriesUseCase(
    this.getCategroirsDomainRepo,
  );

  Future<Either<Falirues, GetCategoriesEntity>> call() {
    return getCategroirsDomainRepo.getCategiories();
  }
}

class GetCategorieDetailsUseCase {
  GetCategroirsDetailsDomainRepo getCategroirsDetailsDomainRepo;
  GetCategorieDetailsUseCase(
    this.getCategroirsDetailsDomainRepo
  );

  Future<Either<Falirues, ProductEntity>> call(int id) {
    return getCategroirsDetailsDomainRepo.getCategioriesDetails(id);
  }
}
