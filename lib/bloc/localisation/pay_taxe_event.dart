part of 'pay_taxe_bloc.dart';

@immutable
abstract class LocalisationEvent extends Equatable {
  const LocalisationEvent();

  @override
  List<Object> get props => [];
}

class TickedLocalisation extends LocalisationEvent {
  final int duration;

  const TickedLocalisation({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "Tick { duration: $duration }";
}

class StartLocation extends LocalisationEvent {
  final int duration;

  const StartLocation({@required this.duration});

  @override
  List<Object> get props => [duration];
}

class RefreshLocation extends LocalisationEvent {
  final int duration;

  const RefreshLocation({@required this.duration});

  @override
  List<Object> get props => [duration];
}

class StopLocation extends LocalisationEvent {}

// class FetchLocation extends LocalisationEvent {
//   final Localisation localisation;

//   const FetchLocation({@required this.localisation})
//       : assert(localisation != null);

//   @override
//   List<Object> get props => [localisation];
// }
