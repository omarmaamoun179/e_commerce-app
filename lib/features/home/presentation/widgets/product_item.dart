import 'package:e_commerce/features/home/domain/entities/product_entity/datum.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  DatumProdcutEntity model;

  ProductItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
                color: const Color(0xff004182).withOpacity(.3), width: 2.w),
          ),
          width: 191.w,
          height: 237.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r)),
                    child: Image.network(
                      model.image ?? "",
                      height: 128.h,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                  Text(
                    model.name ?? "",
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0xff06004F)),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    model.description ?? "",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0xff06004F)),
                  ),

                  Row(
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        'EGP ${model.price}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        '${model.oldPrice}'.substring(0, 4),
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F),
                        ),
                      ),
                    ],
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 50),
                  //     child: Align(
                  //       alignment: Alignment.topRight,
                  //       child: IconButton(
                  //           onPressed: () async {
                  //             HomeCubit.get(context)
                  //                 .changeCart(model.id!, context);
                  //           },
                  //           icon: CircleAvatar(
                  //             backgroundColor: Colors.white,
                  //             radius: 15.r,
                  //             child: const Icon(
                  //               Icons.shopping_cart,
                  //             ),
                  //           )),
                  //     ),
                  //   ),
                  // ),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(500.w, 100.h),
                        backgroundColor: const Color(0xff004182),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      onPressed: () {
                        HomeCubit.get(context).changeCart(model.id!, context);
                      },
                      child: const Text(
                        'Add to Cart',
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      HomeCubit.get(context).changeFav(model.id!);
                    },
                    icon: CircleAvatar(
                      backgroundColor: HomeCubit.get(context).fav[model.id]!
                          ? const Color(0xff004182)
                          : Colors.white,
                      radius: 15.r,
                      child: const Icon(
                        Icons.favorite_border,
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
/**
 *  Container(
      height: 237.h,
      width: 191.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              color: const Color(0xff004182).withOpacity(.3), width: 2.w)),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                child: Image.network(
                  model.imageCover ?? "",
                  height: 128.h,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.title ?? "",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F)),
                    ),
                    Text(
                      model.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          model.price.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(0xff06004F)),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          (model.price ?? 50 - 50).toString(),
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.lineThrough,
                              decorationColor:
                                  const Color(0xff004182).withOpacity(.6)
                              // Replace with your desired color
                              ,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: const Color(0xff004182).withOpacity(.6)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Review (${model.ratingsAverage})',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: const Color(0xff06004F)),
                        ),
                        Icon(
                          Icons.star,
                          color: const Color(0xffFDD835),
                          size: 15.h,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  // fav = !fav;
                  // setState(() {});
                },
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: Colors.white,
                  child: const Center(
                    child: Icon(Icons.favorite_border),
                    // child: fav
                    //     ? Image.asset('assets/images/Vectorhart_full.png')
                    //     : Image.asset('assets/images/heart.png'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: const Color(0xff004182),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  
 */
