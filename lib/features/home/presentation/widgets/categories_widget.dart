import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return HomeCubit.get(context).catategories!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: 220.h,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8,
                      crossAxisSpacing: .8,
                      mainAxisSpacing: .8),
                  itemCount: HomeCubit.get(context).catategories!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 45.r,
                          foregroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 40.r,
                            backgroundImage: Image.network(
                              HomeCubit.get(context)
                                      .catategories![index]
                                      .image ??
                                  '',
                            ).image,
                          ),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          HomeCubit.get(context).catategories![index].name ??
                              '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}
