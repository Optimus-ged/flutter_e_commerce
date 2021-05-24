import 'package:e_commerce/exports/all_exports.dart';
import 'package:dio/dio.dart';

class ConnectivityRequestRetry {
  final Dio dio;
  final Connectivity connectivity;
  ConnectivityRequestRetry({@override this.dio, this.connectivity});

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    // Defining valiables
    final responseCompleter = Completer<Response>();
    StreamSubscription streamSubscription;

    // Use of streamsubscription to avoid the connectivity to listen
    // every time, so it will only listen when the connectivity result changes
    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription.cancel();
          responseCompleter.complete(
            dio.request(
              requestOptions.path,
              onSendProgress: requestOptions.onReceiveProgress,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              cancelToken: requestOptions.cancelToken,
              queryParameters: requestOptions.queryParameters,
              // options:
            ),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}
