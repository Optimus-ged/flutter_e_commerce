import 'dart:async';

import 'package:e_commerce/exports/all_exports.dart';
import 'package:dio/dio.dart';

class ConnectivityRequestRetry {
  final Dio dio;
  final Connectivity connectivity;
  ConnectivityRequestRetry({@override this.dio, this.connectivity});

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    final responseCompleter = Completer<Response>();
    connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          responseCompleter.complete(dio.request(
            requestOptions.path,
            onSendProgress: requestOptions.onReceiveProgress,
            onReceiveProgress: requestOptions.onReceiveProgress,
            data: requestOptions.data,
            cancelToken: requestOptions.cancelToken,
            queryParameters: requestOptions.queryParameters,
            // options: requestOptions,
          ));
        }
      },
    );
    return responseCompleter.future;
  }
}
