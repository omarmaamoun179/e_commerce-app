import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/liked_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeGetFavLoading) {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        } else if (state is HomeGetFavError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message.toString()),
            ),
          );
        } else if (state is HomeGetFavSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return HomeCubit.get(context).favourites.isEmpty
            ? Center(
                child: Text(
                  'No Favourites ,\n please add some products',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: const Color(0xff004182),
                  ),
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 25.h,
                  );
                },
                itemCount: HomeCubit.get(context).favourites.length,
                itemBuilder: (context, index) {
                  return LikedWidget(
                    product: HomeCubit.get(context).favourites[index],
                  );
                });
      },
    );
  }
}
