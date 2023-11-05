import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrandsWidget extends StatelessWidget {
  const PrandsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return HomeCubit.get(context).prands!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: 250.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: HomeCubit.get(context).prands!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          backgroundImage: NetworkImage(
                            HomeCubit.get(context).prands![index].image ?? '',
                          ),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          HomeCubit.get(context).prands![index].name ?? '',
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
