import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/get_cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {
  GetCartEntity model;
  GetCartSuccess(this.model);
}

class GetCartError extends CartState {
  Falirues message;
  GetCartError(this.message);
}
