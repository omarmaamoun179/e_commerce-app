import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';
import 'package:e_commerce/features/home/domain/entities/add_to_fav_entity/add_to_fav_entity.dart';
import 'package:e_commerce/features/home/domain/entities/fav_entity/fav_entity.dart';
import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity.dart';
import 'package:e_commerce/features/home/domain/entities/get_prands/get_prands.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:e_commerce/features/home/domain/entities/update_user_entity/update_user_entity.dart';
import 'package:e_commerce/features/home/domain/entities/user_entity/user_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeGetCategoriesSuccess extends HomeState {
  GetCategoriesEntity model;
  HomeGetCategoriesSuccess(this.model);
}

class HomeGetCategoriesError extends HomeState {
  Falirues message;
  HomeGetCategoriesError(this.message);
}

class HomeGetPrandsSuccess extends HomeState {
  GetPrandsEntity model;
  HomeGetPrandsSuccess(this.model);
}

class HomeGetPrandsError extends HomeState {
  Falirues message;
  HomeGetPrandsError(this.message);
}

class HomeChangeBottomNav extends HomeState {}

class HomeChangeindicatorIndex extends HomeState {}

class HomeChangeTab extends HomeState {}

class HomeProductLoading extends HomeState {}

class HomeProductSuccess extends HomeState {
  ProductEntity model;
  HomeProductSuccess(this.model);
}

class HomeProductError extends HomeState {
  Falirues message;
  HomeProductError(this.message);
}

class HomeChangeFavorite extends HomeState {}

class HomeGetFavLoading extends HomeState {}

class HomeGetFavSuccess extends HomeState {
  FavEntity favEntity;
  HomeGetFavSuccess(this.favEntity);
}

class HomeGetFavError extends HomeState {
  Falirues message;
  HomeGetFavError(this.message);
}

class HomeAddToFavLoading extends HomeState {}

class HomeAddToFavSuccess extends HomeState {
  AddToFavEntity favEntity;
  HomeAddToFavSuccess(this.favEntity);
}

class HomeAddToFavError extends HomeState {
  Falirues message;
  HomeAddToFavError(this.message);
}

class HomeAddToCartLoading extends HomeState {}

class HomeAddToCartSuccess extends HomeState {
  AddToCartEntity CartEntity;
  HomeAddToCartSuccess(this.CartEntity);
}

class HomeAddToCartError extends HomeState {
  Falirues message;
  HomeAddToCartError(this.message);
}

class HomeGetUserError extends HomeState {
  Falirues message;
  HomeGetUserError(this.message);
}

class HomeGetUserLoading extends HomeState {}

class HomeGetUserSuccess extends HomeState {
  UserEntity userModel;
  HomeGetUserSuccess(this.userModel);
}

class UpdateUserSuccess {
 UpdateUserEntity userModel;
  UpdateUserSuccess(this.userModel);
}

class UpdateUserError {
  Falirues message;
  UpdateUserError(this.message);
}
