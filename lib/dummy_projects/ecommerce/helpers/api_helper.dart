import 'package:dio/dio.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/helpers/api_const.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper instance = ApiHelper._();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConst.BASE_URL,
      headers: {
        "Content-Type": "application/json",
        "lang": "en",
      },
    ),
  );

  Future<Response> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParams,
      );
      return response;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioError catch (e) {
      throw e;
    }
  }
}
