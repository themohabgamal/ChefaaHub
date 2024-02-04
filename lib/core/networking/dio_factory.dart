import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  //private constructor for singleton
  DioFactory._();
  static Dio? dio;
  static getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = timeOut;
      dio!.options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio;
    } else {
      return dio;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }
}
