import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/cashe_helper.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/searc_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/tab_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/tabs_content.dart';
import 'package:e_commerce/features/home/presentation/widgets/vertical_taps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetProductByCategorySuccess) {
      
        } else if (state is GetProductByCategoryError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message.toString()),
            ),
          );
        } else if (state is GetProductByCategoryLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        return Column(
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
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16.h, right: 24.w),
                child: VerticalTabs(
                  direction: TextDirection.ltr,
                  disabledChangePageFromContentView: true,
                  indicatorColor: const Color(0xff004182),
                  selectedTabBackgroundColor: Colors.transparent,
                  tabBackgroundColor: const Color(0xffDBE4ED),
                  indicatorSide: IndicatorSide.start,
                  indicatorWidth: 7.w,
                  tabsElevation: 3,
                  onSelect: (tabIndex) {
                    tabIndex =
                        HomeCubit.get(context).catategories[tabIndex].id!;
                    HomeCubit.get(context).getCategoryDetails(tabIndex);
                  },
                  tabTextStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color(0xff004182),
                  ),
                  tabsWidth: 120.w,
                  tabs: HomeCubit.get(context)
                      .catategories
                      .map((e) => Tab(
                              child: TabsWidget(
                            data: e.name ?? '',
                          )))
                      .toList(),
                  contents: HomeCubit.get(context).catategories.map((e) {
                    return const TabsConten();
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
