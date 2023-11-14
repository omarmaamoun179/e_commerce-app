import 'package:e_commerce/features/home/data/datasources/add_to_cart_ds.dart';
import 'package:e_commerce/features/home/data/datasources/add_to_fav_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_categories_data.dart';
import 'package:e_commerce/features/home/data/datasources/get_fav_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_prand_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_user_ds.dart';
import 'package:e_commerce/features/home/data/datasources/product_data_sourec.dart';
import 'package:e_commerce/features/home/data/datasources/update_profile_ds.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateUserWidget extends StatefulWidget {
  const UpdateUserWidget({super.key});

  @override
  State<UpdateUserWidget> createState() => _UpdateUserWidgetState();
}

class _UpdateUserWidgetState extends State<UpdateUserWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        GetCategoriesRemote(),
        RemoteGetPrandsDataSorce(),
        RemoteGetFav(),
        RemoteProductDataSource(),
        RemoteAddToFav(),
        RemoteAddToCart(),
        RemoteGetUserDataSource(),
        RemoteUpdateProfileDs(),
      ),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is UpdateUserSuccess) {
           
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profile Updated Successfully'),
              ),
            );
          } else if (state is UpdateUserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text('Profile Updated Failed please complete your data'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(12),
            color: Colors.black12,
            width: double.infinity,
            height: 500.h,
            child: Expanded(
              child: Column(
                children: [
                  Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextField(
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                        ),
                        color: const Color(0xff004182),
                        fontWeight: FontWeight.w500),
                    controller: HomeCubit.get(context).nameController,
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
                    controller: HomeCubit.get(context).emailController,
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
                    controller: HomeCubit.get(context).phoneController,
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
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        HomeCubit.get(context).updateProfile();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350.w, 50.h),
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
          );
        },
      ),
    );
  }
}
