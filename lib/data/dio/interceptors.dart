import 'package:dio/dio.dart';

class AppInterceptors extends InterceptorsWrapper {
  // @override
  // Future onRequest(RequestOptions options) {
  //   print(
  //       "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
  //   print("Headers:");
  //   options.headers.forEach((k, v) => print('$k: $v'));
  //   if (options.queryParameters != null) {
  //     print("queryParameters:");
  //     options.queryParameters.forEach((k, v) => print('$k: $v'));
  //   }
  //   if (options.data != null) {
  //     print("Body: ${options.data}");
  //   }
  //   print(
  //       "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

  //   return options;
  // }

  // @override
  // Future<dynamic> onError(DioError dioError) {
  //   print(
  //       "<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}");
  //   print(
  //       "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
  //   print("<-- End error");
  // }

  // @override
  // Future<dynamic> onResponse(Response response) {
  //   print(
  //       "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
  //   print("Headers:");
  //   response.headers?.forEach((k, v) => print('$k: $v'));
  //   print("Response: ${response.data}");
  //   print("<-- END HTTP");
  // }
}

