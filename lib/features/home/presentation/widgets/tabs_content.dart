import 'package:e_commerce/features/home/data/models/categorie_image_model.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsConten extends StatelessWidget {
  TabsConten({
    super.key,
  });
  CategoryImage? path;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          HomeCubit.get(context).menFashion.first.imagePath,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 25,
            ),
            itemCount: HomeCubit.get(context).menFashion.length - 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    HomeCubit.get(context).menFashion[index + 1].imagePath,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    HomeCubit.get(context).menFashion[index + 1].text ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff004182),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
/**
 *   
 */
