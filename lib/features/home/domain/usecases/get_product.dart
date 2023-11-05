import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_product_domin_repo.dart';

class GetProductUseCase {
  GetProductDomainRepo getProductDomainRepo;
  GetProductUseCase(this.getProductDomainRepo);
  Future<Either<Falirues, ProductEntity>> call() {
    return getProductDomainRepo.getProduct();
  }
}
