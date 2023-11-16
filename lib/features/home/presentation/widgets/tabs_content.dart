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
        return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            scrollDirection: Axis.vertical,
            children: HomeCubit.get(context).products!.map((e) {
              return Column(
                children: [
                  Image.network(
                    e.image ?? '',
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Text(
                      maxLines: 1,
                      e.name ?? '',
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
            }).toList());
      },
    );
  }
}
/**
 *   
 */
