import 'package:dio/dio.dart';
import 'package:it_tickets/Core/Helpers/constants/constants.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.9:8000/api',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          Headers.acceptHeader: 'application/json',
          Headers.contentTypeHeader: 'application/json',
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));


  }
  static Options _optionsWithToken() {
    return Options(
      headers: {
        'Authorization': 'Bearer ${Constants.userToken}',
      },
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await dio.get(url, queryParameters: query, options: _optionsWithToken());
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _optionsWithToken(),
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await dio.delete(url, queryParameters: query, options: options);
  }
}
