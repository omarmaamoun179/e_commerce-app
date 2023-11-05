import 'package:e_commerce/features/login/data/datasources/login_data_source.dart';
import 'package:e_commerce/features/login/data/repositories/login_data_repo.dart';
import 'package:e_commerce/features/login/domain/entities/login_data.dart';
import 'package:e_commerce/features/login/domain/repositories/login_domain_repo.dart';
import 'package:e_commerce/features/login/domain/usecases/login_use_case.dart';
import 'package:e_commerce/features/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginDataSource loginDataSource;
  LoginCubit(this.loginDataSource) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisible = true;
  GlobalKey<FormState> fromKey = GlobalKey();
  login() async {
    LoginDomainRepo loginDomainRepo = LoginDataRepo(loginDataSource);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    LoginData data = LoginData(
        email: emailController.text, password: passwordController.text);
    var result = await loginUseCase.call(data);
    result.fold((l) => emit(LoginFailed(l)), (r) => emit(LoginSuccess(r)));
  }

  changeVisibilty() {
    isVisible = !isVisible;
    emit(LoginChangeVisibility());
  }
}
