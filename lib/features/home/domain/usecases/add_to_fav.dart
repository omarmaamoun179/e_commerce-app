import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_fav_entity/add_to_fav_entity.dart';
import 'package:e_commerce/features/home/domain/entities/fav_entity/fav_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/add_to_fav.dart';
import 'package:e_commerce/features/home/domain/repositories/get_fav_domain_repo.dart';

class AddToFavUseCase {
  AddToFavDomainRepo addToFavDomainRepo;
  AddToFavUseCase(this.addToFavDomainRepo);
  Future<Either<Falirues, AddToFavEntity>> call(int product_id) {
    return addToFavDomainRepo.addToFav(product_id);
  }
}
