import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SingupWidget extends StatelessWidget {
  SingupWidget({
    super.key,
    required this.txt,
    required this.hint,
    required this.message,
    this.keyboardType,
    this.controller,
    this.obscureText,
    this.suffixIcon,
  });
  String txt;
  String message;
  TextInputType? keyboardType;
  String hint;
  TextEditingController? controller;
  bool? obscureText;
  Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        TextFormField(
          obscureText: obscureText ?? false,
          textInputAction: TextInputAction.next,
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) {
            if (value!.isEmpty) {
              return message;
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: const Color(
                  0xff9FA5BB,
                ),
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.red, width: 4.w),
            ),
            errorStyle: TextStyle(
              color: Colors.red,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
      ],
    );
  }
}
