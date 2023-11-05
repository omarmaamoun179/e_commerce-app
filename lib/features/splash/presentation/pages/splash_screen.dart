import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..goToLoginScreen(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashTimer) {
            Navigator.pushReplacementNamed(context, Routes.login);
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppImages.splash,
                ),
              ),
            ),
            child: const Scaffold(backgroundColor: Colors.transparent),
          );
        },
      ),
    );
  }
}
