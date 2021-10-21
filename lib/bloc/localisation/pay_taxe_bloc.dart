import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_commerce/views/shared/shared_index.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'ticker.dart';

part 'pay_taxe_event.dart';
part 'pay_taxe_state.dart';

class LocalisationBloc extends Bloc<LocalisationEvent, LocalisationState> {
  get _api => locator.get<DataRepository>();
  final Ticker _ticker;
  static const int _duration = 1000;

  StreamSubscription<int> _tickerSubscription;

  LocalisationBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker,
        super(LocalisationInitial(_duration));

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<LocalisationState> mapEventToState(LocalisationEvent event) async* {
    if (event is StartLocation)
      yield* _mapStartLocationToState(event);
    else if (event is TickedLocalisation)
      yield* _mapTickedLocalisationToState(event);
    else if (event is RefreshLocation)
      yield* _mapRefreshLocationToState(event);
    // else if (event is FetchLocation)
    //   yield* _mapFetchLocationToState(event);
    else if (event is StopLocation)
      yield* _mapStopLocationToState(event);
  }

  Stream<LocalisationState> _mapStartLocationToState(
      StartLocation event) async* {
    try {
      yield LocalisationInProgress(event.duration);
      _tickerSubscription = _ticker
          .tick(ticks: event.duration)
          .listen((duration) => add(TickedLocalisation(duration: duration)));
    } catch (error, stackTrace) {
      print('CarteBloc.MapStartLocationToState ::: '
          'ERROR: $error, STACKTRACE: $stackTrace');
      yield LocalisationFailure(status: error.statusCode);
    }
  }

  Stream<LocalisationState> _mapRefreshLocationToState(
      RefreshLocation refresh) async* {
    yield LocalisationInProgress(_duration);
    _tickerSubscription = _ticker
        .tick(ticks: _duration)
        .listen((duration) => add(TickedLocalisation(duration: duration)));
  }

  Stream<LocalisationState> _mapStopLocationToState(
      StopLocation refresh) async* {
    _tickerSubscription?.cancel();
    yield LocalisationInitial(_duration);
  }

  Stream<LocalisationState> _mapTickedLocalisationToState(
      TickedLocalisation tick) async* {
    yield tick.duration > 0
        ? LocalisationInProgress(tick.duration)
        : LocalisationRestart(0);
  }

  // Stream<LocalisationState> _mapFetchLocationToState(
  //     FetchLocation event) async* {
  //   try {
  //     // String token = await _sharedPreferencesHelper.authToken;
  //     final response = await _api.postLocalisation(token, event.localisation);
  //     if (response.status == 200) {
  //       yield LocalisationSuccess(localisation: response);
  //     } else {
  //       yield LocalisationFailure();
  //       return;
  //     }
  //   } catch (error, stackTrace) {
  //     print('CarteBloc.MapFetchLocationToState ::: '
  //         'ERROR: $error, STACKTRACE: $stackTrace');
  //     yield LocalisationFailure(status: error.statusCode);
  //   }
  // }
}
