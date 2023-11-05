import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWidget extends StatelessWidget {
  TabsWidget({super.key, required this.data});
  String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 137.w,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        data,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: const Color(0xff004182),
        ),
      ),
    );
  }
}
