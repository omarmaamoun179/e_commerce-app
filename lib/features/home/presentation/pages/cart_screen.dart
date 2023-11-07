import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 25.h,
                );
              },
              itemCount: HomeCubit.get(context).carts.length,
              itemBuilder: (context, index) {
                return CartWidget(
                   HomeCubit.get(context).carts[index].product!,
                );
              }),
        );
      },
    );
  }
}
