import 'package:bloc/bloc.dart';
import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/utils/bloc_observer.dart';
import 'package:e_commerce/core/utils/cashe_helper.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CasheHelper.initCashe();
  DioHelper.initDio();
  Constant.token = CasheHelper.getData('token');

  print(Constant.token);
  String start;
  if (Constant.token == null) {
    start = Routes.login;
  } else {
    start = Routes.home;
  }
  SystemChrome.setPreferredOrientations([])
      .then((value) => runApp(MyApp(startRoute: start)));
}
