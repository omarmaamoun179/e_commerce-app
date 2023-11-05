part of 'signup_cubit.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SingUpSuccess extends SignupState {
  RepoEntity model;
  SingUpSuccess(this.model);
}

class SingUpFailed extends SignupState {
  Falirues message;
  SingUpFailed(this.message);
}

class SingUpChangeVisibility extends SignupState {}
