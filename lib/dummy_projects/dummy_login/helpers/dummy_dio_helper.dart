import 'package:dio/dio.dart';

class DummyDioHelper {
  static Dio? _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        headers: {
          "lang": "ar",
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future postData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio!.post(
      path,
      data: body,
      queryParameters: queryParams,
    );
    print(response);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
