import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsConten extends StatelessWidget {
  const TabsConten({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 25,
          ),
          itemCount: HomeCubit.get(context).products!.length - 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.network(
                  HomeCubit.get(context).products![index].image ?? '',
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Text(
                    maxLines: 1,
                    HomeCubit.get(context).products![index].name ?? '',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff004182),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
/**
 *   
 */
