import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/domain/entities/login_entity/login_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginEntity model;
  LoginSuccess(this.model);
}

class LoginFailed extends LoginState {
  Falirues message;
  LoginFailed(this.message);
}

class LoginChangeVisibility extends LoginState {}
