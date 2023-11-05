import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/add_to_fav_ds.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_fav_entity/add_to_fav_entity.dart';
import 'package:e_commerce/features/home/domain/entities/fav_entity/fav_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/add_to_fav.dart';

class AddToFavDataRepo implements AddToFavDomainRepo {
  AddToFavDataSource addToFavDataSource;

  AddToFavDataRepo(this.addToFavDataSource);

  @override
  Future<Either<Falirues, AddToFavEntity>> addToFav(int product_id) {
    return addToFavDataSource.addToFav(product_id);
  }
}
