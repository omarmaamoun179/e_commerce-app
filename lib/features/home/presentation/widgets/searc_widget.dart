import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'what do you search for?',
        hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w300,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.only(left: 20.w),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xff004182),
          size: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: Color(0xff004182),
          ),
        ),
      ),
    );
  }
}
