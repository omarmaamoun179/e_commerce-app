import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/signup/data/datasources/singup_data_source.dart';
import 'package:e_commerce/features/signup/data/repositories/singupu_repo.dart';
import 'package:e_commerce/features/signup/domain/entities/register_data.dart';
import 'package:e_commerce/features/signup/domain/entities/repo_entity/repo_entity.dart';
import 'package:e_commerce/features/signup/domain/repositories/repo_domain.dart';
import 'package:e_commerce/features/signup/domain/usecases/singup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignUpDataSource signUpDataSource;
  SignupCubit(this.signUpDataSource) : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisible = true;
  void sinUp() async {
    emit(SignupLoading());
    SignUpDomainRepo signUpRepoDomain = SingupDateRepo(signUpDataSource);
    SingUpUseCase singUpUseCase = SingUpUseCase(signUpRepoDomain);

    SingUpData data = SingUpData(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
      phone: phoneController.text,
    );
    print(data.toString());
    var result = await singUpUseCase.call(data);
    result.fold((l) {
      emit(SingUpFailed(l));
    }, (r) {
      emit(SingUpSuccess(r));
    });
  }

  changeVisibility() {
    isVisible = !isVisible;
    emit(SingUpChangeVisibility());
  }
}
