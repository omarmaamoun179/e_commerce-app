import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/datasources/get_fav_ds.dart';
import 'package:e_commerce/features/home/domain/entities/fav_entity/fav_entity.dart';
import 'package:e_commerce/features/home/domain/repositories/get_fav_domain_repo.dart';

class GetFavDataRepo implements GetFavDomainRepo {
  GetFavDataSource getFavDataSource;
  GetFavDataRepo(this.getFavDataSource);
  @override
  Future<Either<Falirues, FavEntity>> getFav() {
    return getFavDataSource.getFav();
  }
}
