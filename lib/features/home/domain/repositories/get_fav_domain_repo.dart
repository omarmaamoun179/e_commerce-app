import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/fav_entity/fav_entity.dart';

abstract class GetFavDomainRepo {
  Future<Either<Falirues, FavEntity>> getFav();
}
