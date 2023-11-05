import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/product_data_sourec.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_product_domin_repo.dart';

class GetProductDataRepo implements GetProductDomainRepo {
  ProductDataSource productDataSource;
  GetProductDataRepo(this.productDataSource);
  @override
  Future<Either<Falirues, ProductEntity>> getProduct() {
    return productDataSource.getProduct();
  }
}
