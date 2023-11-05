import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_fav_entity/add_to_fav_entity.dart';
import 'package:e_commerce/features/home/domain/entities/fav_entity/fav_entity.dart';

abstract class AddToFavDomainRepo {
  Future<Either<Falirues, AddToFavEntity>> addToFav(int product_id);
}
