import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    debugPrint('Main.SimpleBlocObserver.OnEvent ::: EVENT: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint(
        'Main.SimpleBlocObserver.OnTransition ::: TRANSITION: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(
      'Main.SimpleBlocObserver.OnError ::: '
      'ERROR: $error & STACKTRACE: $stackTrace',
    );
    super.onError(bloc, error, stackTrace);
  }
}
