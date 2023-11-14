import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/cart_item.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartWidget extends StatelessWidget {
  CartWidget({
    Key? key,
    this.product,
  }) : super(key: key);

  CartItem? product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeAddToCartLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeAddToCartSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Success'),
                content: Text(state.CartEntity.message.toString()),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(12),
          width: 398.w,
          height: 113.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xff004182),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  product!.product!.image ?? '',
                  width: 120.w,
                  height: 113.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 135.w,
                      height: 80.h,
                      child: ListView(
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            product!.product!.name ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 82.w,
                          height: 25.h,
                          child: Text(
                            maxLines: 1,
                            product!.product?.price.toString() ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              color: const Color(0xff004182),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 73.w,
                          height: 18.h,
                          child: Text(
                            maxLines: 1,
                            product!.product?.oldPrice.toString() ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              color: const Color(0xff004182),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 35.w,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  InkWell(
                      onTap: () async {
                        HomeCubit.get(context)
                            .changeCart(product!.product!.id!, context);
                      },
                      child: const Icon(Icons.delete_outline_outlined))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

/**
 * Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            width: 400.w,
            height: 130.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xff004182),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      width: 120.w,
                      height: 113.h,
                      product!.product!.image ?? ''),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            product!.product!.name ?? '',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            maxLines: 1,
                            product!.product!.description ?? '',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Text(
                                maxLines: 1,
                                product!.product!.price.toString() ?? '',
                                style: TextStyle(
                                    color: const Color(0xff004182),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                maxLines: 1,
                                product!.product!.oldPrice.toString() ?? '',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    HomeCubit.get(context).changeFav(product!.product!.id!);
                  },
                  icon: CircleAvatar(
                    backgroundColor:
                        HomeCubit.get(context).fav[product!.product!.id]!
                            ? const Color(0xff004182)
                            : Colors.white,
                    radius: 15.r,
                    child: const Icon(
                      Icons.favorite_border,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff004182),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'add to cart',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          );
        
 */
