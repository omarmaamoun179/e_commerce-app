import 'package:e_commerce/core/utils/bot_toats.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/cutom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeGetCategoriesError) {
          CustomNotifaction.showSuccessNotifation('error  ');
        } else if (state is HomeGetCategoriesSuccess) {
        } else if (state is HomeGetPrandsError) {
          CustomNotifaction.showSuccessNotifation('error  ');
        } else if (state is HomeGetPrandsSuccess) {}
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                //
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r)),
            child: CustomBottomNavigationBar(
              currentIndex: HomeCubit.get(context).currentIndex,
              onTap: (index) {
                HomeCubit.get(context).changeBottomNav(index);
              },
            ),
          ),
          body: HomeCubit.get(context)
              .screens[HomeCubit.get(context).currentIndex],
        );
      },
    );
  }
}
