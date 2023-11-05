import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/bot_toats.dart';
import 'package:e_commerce/core/utils/cashe_helper.dart';
import 'package:e_commerce/features/login/presentation/cubit/login_cubit.dart';
import 'package:e_commerce/features/login/presentation/cubit/login_state.dart';
import 'package:e_commerce/features/signup/presentation/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoginFailed) {
          CustomNotifaction.showSuccessNotifation(
              'incorrect email or password');
        } else if (state is LoginSuccess) {
          CasheHelper.saveData('token', state.model.data!.token);
          CustomNotifaction.showSuccessNotifation("Success");
          Navigator.pushNamed(context, Routes.home);
        }
      },
      builder: (context, state) {
        return Form(
          key: LoginCubit.get(context).fromKey,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: const Color(0xff004182),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 237.w,
                  height: 72.h,
                  margin: EdgeInsets.only(
                      top: 91.h, right: 97.w, left: 97.w, bottom: 87.h),
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
                Text(
                  'Welcome Back To Route',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Please Signin With Your Account',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xffFFFFFF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SingupWidget(
                            controller: LoginCubit.get(context).emailController,
                            txt: 'E-mail',
                            hint: 'Enter your email',
                            message: 'please enter your email',
                          ),
                          SingupWidget(
                            obscureText: LoginCubit.get(context).isVisible,
                            suffixIcon: IconButton(
                              onPressed: () {
                                LoginCubit.get(context).changeVisibilty();
                              },
                              icon: LoginCubit.get(context).isVisible
                                  ? const Icon(
                                      Icons.visibility,
                                    )
                                  : const Icon(Icons.visibility_off),
                            ),
                            controller:
                                LoginCubit.get(context).passwordController,
                            txt: 'Password',
                            hint: 'Enter your Password',
                            message: 'please enter your Password',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (LoginCubit.get(context)
                                  .fromKey
                                  .currentState!
                                  .validate()) {
                                LoginCubit.get(context).login();
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
                              'Login  in',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: const Color(0xff004182),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.singUp);
                                },
                                child: Text(
                                  'Create one',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
