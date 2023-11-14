import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/bottom_sheet.dart';
import 'package:e_commerce/features/home/presentation/widgets/person_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeGetUserLoading) {
          const ShimmreWidget();
        } else if (state is UpdateUserSuccess) {
          HomeCubit.get(context).getUserData();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile Updated Successfully'),
            ),
          );
        } else if (state is UpdateUserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile Updated Failed'),
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          color: Colors.grey,
                          Icons.person,
                          size: 50.sp,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          Text(
                            'Welcome back',
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(HomeCubit.get(context).data?.name ??
                              ''.toString()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  TextField(
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                        ),
                        color: const Color(0xff004182),
                        fontWeight: FontWeight.w500),
                    controller: TextEditingController(
                        text:
                            HomeCubit.get(context).data?.name ?? ''.toString()),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff004182), width: 2.w),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextField(
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                        ),
                        color: const Color(0xff004182),
                        fontWeight: FontWeight.w500),
                    controller: TextEditingController(
                        text: HomeCubit.get(context).data?.email ??
                            ''.toString()),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff004182), width: 2.w),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextField(
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                        ),
                        color: const Color(0xff004182),
                        fontWeight: FontWeight.w500),
                    controller: TextEditingController(
                        text: HomeCubit.get(context).data?.phone ??
                            ''.toString()),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff004182), width: 2.w),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isDismissible: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: const UpdateUserWidget(),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350.w, 80.h),
                        alignment: Alignment.center,
                        backgroundColor: const Color(0xff004182),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: const Text('Update Profile'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
