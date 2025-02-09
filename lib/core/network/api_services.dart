import 'package:bookly/core/network/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  ApiService();

  static late final Dio dio;
  static void initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    Response response =
        await dio.get(endpoint, queryParameters: queryParameters);
    return response;
  }
}
