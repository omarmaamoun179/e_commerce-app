import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/fav_entity/fav_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_fav_domain_repo.dart';

class GetFavUseCase {
  GetFavDomainRepo getFavDomainRepo;
  GetFavUseCase(this.getFavDomainRepo);
  Future<Either<Falirues, FavEntity>> call() {
    return getFavDomainRepo.getFav();
  }
}
