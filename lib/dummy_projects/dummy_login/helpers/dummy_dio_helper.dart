import 'package:dio/dio.dart';

class DummyDioHelper {
  static Dio? _dio = Dio(
    BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      headers: {
        "lang": "ar",
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio!.post(
      path,
      data: body,
      queryParameters: queryParams,
    );
    return response;
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio!.get(
      path,
      data: body,
      queryParameters: queryParams,
    );
    return response;
  }
}
