import 'package:dio/dio.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    print(
      "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}",
    );
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError dioError, ErrorInterceptorHandler handler) async {
    print(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response.requestOptions.baseUrl + dioError.response.requestOptions.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    print("<-- End error");

    if(_shouldRetry(dioError)){
      // TODO implement
    }

    return super.onError(dioError, handler);
  }

  // Handling should retry when connection changed
  bool _shouldRetry(DioError dioError) {
    return dioError.type == DioErrorType.other &&
        dioError.error != null &&
        dioError.error is SocketException;
  }
}
