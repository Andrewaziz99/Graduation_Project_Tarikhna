
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
<<<<<<< HEAD
        baseUrl: 'http://192.168.1.3:8080/', //Change to your IP address but make sure to use the same port
=======
        baseUrl:
            'http://192.168.1.103:8080/', //Change to your IP address but make sure to use the same port
>>>>>>> 5b484e97dc4f801bc418941839f6c26a1177e4cb
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
