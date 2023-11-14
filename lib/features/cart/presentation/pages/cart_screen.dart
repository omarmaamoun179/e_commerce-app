import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is GetCartLoading) {
          const Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff004182),
              ),
            ),
            centerTitle: true,
            title: Text(
              'Cart',
              style: GoogleFonts.poppins(
                color: const Color(0xff004182),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color(0xff004182),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xff004182),
                ),
              ),
            ],
          ),
          body: CartCubit.get(context).carts.isEmpty
              ? Center(
                  child: Text(
                    'No cart added',
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
                  itemCount: CartCubit.get(context).carts.length,
                  itemBuilder: (context, index) {
                    return CartWidget(
                        product: CartCubit.get(context).carts[index]);
                  }),
        );
      },
    );
  }
}
