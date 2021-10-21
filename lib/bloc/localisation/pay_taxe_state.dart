part of 'pay_taxe_bloc.dart';

@immutable
abstract class LocalisationState extends Equatable  {
  final int duration;

  const LocalisationState(this.duration);

  @override
  List<Object> get props => [duration];
}

class LocalisationInitial extends LocalisationState {
  const LocalisationInitial(int duration) : super(duration);
}

class LocalisationInProgress extends LocalisationState {
  const LocalisationInProgress(int duration) : super(duration);
}

class LocalisationFailure extends LocalisationState {
  final int status;

  const LocalisationFailure({this.status}) : super(0);

  @override
  List<Object> get props => [status];
}

class LocalisationRestart extends LocalisationState {
  const LocalisationRestart(int duration) : super(0);
}

// class LocalisationSuccess extends LocalisationState {
//   final LocalisationData localisation;

//   const LocalisationSuccess({@required this.localisation}) : super(0);

//   @override
//   List<Object> get props => [localisation];
// }
