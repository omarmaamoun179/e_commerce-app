import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/cashe_helper.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/carousel_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/prand_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/searc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 17.w, top: 50.5.h),
                    child: Image.asset(
                      'assets/images/route.png',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.w, top: 50.5.h),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.login, (route) => false);
                        CasheHelper.pref!.clear();
                      },
                      child: Text(
                        'Log out',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: const Color(0xff004182),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 348.w,
                    margin: EdgeInsets.only(left: 17.w, top: 18.h),
                    child: const SearchTextField(),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.cart);
                    },
                    icon: Icon(
                      Icons.shopping_cart_checkout,
                      size: 30.sp,
                      color: const Color(0xff004182),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Stack(
                children: [
                  const CarouselWidget(),
                  Positioned(
                    left: 176.w,
                    top: 182.h,
                    child: AnimatedSmoothIndicator(
                      activeIndex: HomeCubit.get(context).activeindex,
                      count: HomeCubit.get(context).images.length,
                      effect: const WormEffect(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xff004182),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color(0xff004182),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              const CategoriesWidget(),
              const PrandsWidget(),
            ],

            //
          ),
        );
      },
    );
  }
}
