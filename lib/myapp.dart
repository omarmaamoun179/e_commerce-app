import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/config/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final String startRoute;
  const MyApp({required this.startRoute, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
          theme: LightTheme.lightTheme,
          builder: BotToastInit(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRoutes.ongenerate(settings),
          initialRoute: startRoute),
    );
  }
}
