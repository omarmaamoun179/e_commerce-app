import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return HomeCubit.get(context).carts.isEmpty
            ? Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Text(
                    'No Favourites ,\n please add some products',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      color: const Color(0xff004182),
                    ),
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
                  return CartWidget(
                    product: HomeCubit.get(context).carts[index],
                  );
                });
      },
    );
  }
}
