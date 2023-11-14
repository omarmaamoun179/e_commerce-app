import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/constant.dart';

class DioHelper {
  static late final Dio dio;
  static initDio() {
    dio = Dio();
  }

  static Future<Response> getData(String path,
      {Map<String, dynamic>? query}) async {
    dio.options.headers = {
      'Authorization': Constant.token ?? '',
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    return await dio.get(
      path,
      queryParameters: query ?? {},
    );
  }

  static Future<Response> postData(String path,
      {Map<String, dynamic>? data}) async {
    dio.options.headers = {
      'Authorization': Constant.token ?? '',
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    return await dio.post(
      path,
      data: data ?? {},
    );
  }
}
