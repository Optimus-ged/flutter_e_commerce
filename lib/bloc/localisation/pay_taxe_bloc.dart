import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_commerce/views/shared/shared_index.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'ticker.dart';

part 'pay_taxe_event.dart';
part 'pay_taxe_state.dart';

class PayTaxeBloc extends Bloc<PayTaxeEvent, PayTaxeState> {
  get _api => locator.get<DataRepository>();
  final Ticker _ticker;
  static const int _duration = 1000;

  StreamSubscription<int> _tickerSubscription;

  PayTaxeBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker,
        super(PayTaxeInitial(_duration));

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<PayTaxeState> mapEventToState(PayTaxeEvent event) async* {
    if (event is StartLocation)
      yield* _mapStartLocationToState(event);
    else if (event is TickedPayTaxe)
      yield* _mapTickedPayTaxeToState(event);
    else if (event is RefreshLocation)
      yield* _mapRefreshLocationToState(event);
    // else if (event is FetchLocation)
    //   yield* _mapFetchLocationToState(event);
    else if (event is StopLocation)
      yield* _mapStopLocationToState(event);
  }

  Stream<PayTaxeState> _mapStartLocationToState(
      StartLocation event) async* {
    try {
      yield PayTaxeInProgress(event.duration);
      _tickerSubscription = _ticker
          .tick(ticks: event.duration)
          .listen((duration) => add(TickedPayTaxe(duration: duration)));
    } catch (error, stackTrace) {
      print('PayTaxebloc.MapStartLocationToState ::: '
          'ERROR: $error, STACKTRACE: $stackTrace');
      yield PayTaxeFailure(status: error.statusCode);
    }
  }

  Stream<PayTaxeState> _mapRefreshLocationToState(
      RefreshLocation refresh) async* {
    yield PayTaxeInProgress(_duration);
    _tickerSubscription = _ticker
        .tick(ticks: _duration)
        .listen((duration) => add(TickedPayTaxe(duration: duration)));
  }

  Stream<PayTaxeState> _mapStopLocationToState(
      StopLocation refresh) async* {
    _tickerSubscription?.cancel();
    yield PayTaxeInitial(_duration);
  }

  Stream<PayTaxeState> _mapTickedPayTaxeToState(
      TickedPayTaxe tick) async* {
    yield tick.duration > 0
        ? PayTaxeInProgress(tick.duration)
        : PayTaxeRestart(0);
  }

  // Stream<PayTaxeState> _mapFetchLocationToState(
  //     FetchLocation event) async* {
  //   try {
  //     // String token = await _sharedPreferencesHelper.authToken;
  //     final response = await _api.postPayTaxe(token, event.PayTaxe);
  //     if (response.status == 200) {
  //       yield PayTaxeSuccess(PayTaxe: response);
  //     } else {
  //       yield PayTaxeFailure();
  //       return;
  //     }
  //   } catch (error, stackTrace) {
  //     print('CarteBloc.MapFetchLocationToState ::: '
  //         'ERROR: $error, STACKTRACE: $stackTrace');
  //     yield PayTaxeFailure(status: error.statusCode);
  //   }
  // }
}
