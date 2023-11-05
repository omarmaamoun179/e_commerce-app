import 'package:e_commerce/features/signup/data/datasources/singup_data_source.dart';
import 'package:e_commerce/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:e_commerce/features/signup/presentation/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/routes/routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        RemoteSignUpDataSource(),
      ),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupLoading) {
            const Center(child: CircularProgressIndicator());
          } else if (state is SingUpFailed) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.message.mssg),
              ),
            );
          } else if (state is SingUpSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.login, (route) => false);
          }
        },
        builder: (context, state) {
          return Form(
            key: SignupCubit.get(context).formKey,
            child: Scaffold(
              backgroundColor: const Color(
                0xff004182,
              ),
              body: Column(
                children: [
                  Container(
                    width: 237.w,
                    height: 72.h,
                    margin: EdgeInsets.only(
                      top: 91.h,
                      right: 97.w,
                      left: 97.w,
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage(
                          'assets/images/Group 5.png',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16.0).w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingupWidget(
                                controller:
                                    SignupCubit.get(context).nameController,
                                txt: "FullName",
                                hint: 'Enter your name please',
                                message: 'please enter correct name',
                                keyboardType: TextInputType.name,
                              ),
                              SingupWidget(
                                controller:
                                    SignupCubit.get(context).emailController,
                                txt: "E-mail",
                                hint: 'Enter your Email please',
                                message: 'please enter correct email',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SingupWidget(
                                controller:
                                    SignupCubit.get(context).phoneController,
                                txt: "Phone",
                                hint: 'Enter your phone please',
                                message: 'please enter correct number',
                                keyboardType: TextInputType.number,
                              ),
                              SingupWidget(
                                obscureText: SignupCubit.get(context).isVisible,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    SignupCubit.get(context).changeVisibility();
                                  },
                                  icon: SignupCubit.get(context).isVisible
                                      ? const Icon(
                                          Icons.visibility,
                                        )
                                      : const Icon(Icons.visibility_off),
                                ),
                                controller:
                                    SignupCubit.get(context).passwordController,
                                txt: "Password",
                                hint: 'Enter your password please',
                                message: 'please enter correct name',
                                keyboardType: TextInputType.name,
                              ),
                              SingupWidget(
                                controller: SignupCubit.get(context)
                                    .passwordConfirmationController,
                                txt: "Confirm Password",
                                hint: 'Confirm your password please',
                                message: 'does not match',
                                keyboardType: TextInputType.name,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (SignupCubit.get(context)
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    SignupCubit.get(context).sinUp();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15).w,
                                  ),
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(398.w, 65.h),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xff004182),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
