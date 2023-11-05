import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/cashe_helper.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/home_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_item.dart';
import 'package:e_commerce/features/home/presentation/widgets/searc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeProductLoading) {
          const Center(child: CircularProgressIndicator());
        } else if (state is HomeAddToFavSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Success'),
                content: Text(state.favEntity.message.toString()),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return HomeCubit.get(context).products!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
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
                    child: GridView.count(
                      padding: const EdgeInsets.all(8.0),
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 5,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 10.h,
                      shrinkWrap: true,
                      children: HomeCubit.get(context)
                          .products!
                          .map((e) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.prodductDetails,
                                    arguments: e);
                              },
                              child: ProductItem(e , 
                              )))
                          .toList()
                    ),
                  ),
                ],
              );
      },
    );
  }
}
