import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/get_prands/get_prands.dart';
import 'package:e_commerce/features/home/domain/repositories/get_prands_repo.dart';

class GetPrandsUseCase {
  GetPrandsDomainRepo getPrandsDomainRepo;
  GetPrandsUseCase(this.getPrandsDomainRepo);
  Future<Either<Falirues, GetPrandsEntity>> call() {
    return getPrandsDomainRepo.getPrands();
  }
}
