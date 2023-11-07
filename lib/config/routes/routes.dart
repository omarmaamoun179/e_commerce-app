import 'package:e_commerce/features/home/data/datasources/add_to_cart_ds.dart';
import 'package:e_commerce/features/home/data/datasources/add_to_fav_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_cart_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_categories_data.dart';
import 'package:e_commerce/features/home/data/datasources/get_fav_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_prand_ds.dart';
import 'package:e_commerce/features/home/data/datasources/product_data_sourec.dart';
import 'package:e_commerce/features/home/data/models/product_model/datum.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/pages/cart_screen.dart';
import 'package:e_commerce/features/home/presentation/pages/home_layout.dart';
import 'package:e_commerce/features/login/data/datasources/login_data_source.dart';
import 'package:e_commerce/features/login/presentation/cubit/login_cubit.dart';
import 'package:e_commerce/features/login/presentation/pages/login_screen.dart';
import 'package:e_commerce/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerce/features/signup/presentation/pages/singup_screen.dart';
import 'package:e_commerce/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String splash = '/splash';

  static const String login = "login";
  static const String singUp = "singUp";
  static const String home = "home";
  static const String prodductDetails = "prodduct_details";
  static const String cart = "carts";
}

class AppRoutes {
  static Route? ongenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(RemoteLoginDataSource()),
                  child: const LoginScreen(),
                ));
      case Routes.singUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => HomeCubit(
                        GetCategoriesRemote(),
                        RemoteGetPrandsDataSorce(),
                        RemoteGetFav(),
                        RemoteProductDataSource(),
                        RemoteAddToFav(),
                        RemoteCartsDataSource(),
                        RemoteAddTocartDataSource(),
                      )
                        ..getPrands()
                        ..getCategory()
                        ..getProduct()
                        ..getFavorite()
                        ..getCart()),
            ],
            child: const HomeScreen(),
          ),
        );
      case Routes.prodductDetails:
        return MaterialPageRoute(
          builder: (context) => ProductDetails(
            model: routeSettings.arguments as DatumProdcutModel,
          ),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(
              GetCategoriesRemote(),
              RemoteGetPrandsDataSorce(),
              RemoteGetFav(),
              RemoteProductDataSource(),
              RemoteAddToFav(),
              RemoteCartsDataSource(),
              RemoteAddTocartDataSource(),
            )..getCart(),
            child: const CartsScreen(),
          ),
        );
      //

      default:
        MaterialPageRoute(builder: (_) => unDefindeRoute());
    }
    return null;
  }

  static Widget unDefindeRoute() => const Scaffold(
        body: Center(
          child: Text("Page not found"),
        ),
      );
}
