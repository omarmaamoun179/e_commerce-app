import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNotifaction {
  static void showSuccessNotifation(String msg) {
    BotToast.showCustomNotification(
      duration: const Duration(seconds: 2),
      toastBuilder: (cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 28.h, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.green,
            ),
            width: double.infinity,
            height: 100.h,
            child: Expanded(
              child: Row(
                children: [
                  Text(
                    msg,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: cancelFunc,
                      icon: Icon(Icons.close, color: Colors.red, size: 20.w),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showErrorNotifation(String msg) {
    BotToast.showCustomNotification(
      duration: const Duration(seconds: 2),
      toastBuilder: (cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 28.h, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.red[400],
            ),
            width: double.infinity,
            height: 80.h,
            child: Row(
              children: [
                Text(
                  msg,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  width: 220.w,
                ),
                Expanded(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: cancelFunc,
                    icon: Icon(Icons.close, color: Colors.white, size: 20.w),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
