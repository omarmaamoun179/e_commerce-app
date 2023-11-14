import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmreWidget extends StatelessWidget {
  const ShimmreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.grey[300],
              child: Icon(
                color: Colors.grey,
                Icons.person,
                size: 50.sp,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(color: Colors.grey, height: 20.h, width: 270.w),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  color: Colors.grey,
                  height: 20.h,
                  width: 240.w,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 15.w,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Container(color: Colors.grey, height: 20.h, width: 270.w),
              SizedBox(
                height: 25.h,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(color: Colors.grey, height: 20.h, width: 270.w),
              SizedBox(
                height: 25.h,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(color: Colors.grey, height: 20, width: 270),
              SizedBox(
                height: 25.h,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 50),
                  color: Colors.grey,
                  height: 50.h,
                  width: 250.w),
            ],
          ),
        ),
      ],
    );
  }
}
