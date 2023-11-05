import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  goToLoginScreen(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      emit(SplashTimer());
    });
  }
}
