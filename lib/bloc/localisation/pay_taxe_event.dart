part of 'pay_taxe_bloc.dart';

@immutable
abstract class PayTaxeEvent extends Equatable {
  const PayTaxeEvent();

  @override
  List<Object> get props => [];
}

class TickedPayTaxe extends PayTaxeEvent {
  final int duration;

  const TickedPayTaxe({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "Tick { duration: $duration }";
}

class StartLocation extends PayTaxeEvent {
  final int duration;

  const StartLocation({@required this.duration});

  @override
  List<Object> get props => [duration];
}

class RefreshLocation extends PayTaxeEvent {
  final int duration;

  const RefreshLocation({@required this.duration});

  @override
  List<Object> get props => [duration];
}

class StopLocation extends PayTaxeEvent {}

// class FetchLocation extends PayTaxeEvent {
//   final PayTaxe PayTaxe;

//   const FetchLocation({@required this.PayTaxe})
//       : assert(PayTaxe != null);

//   @override
//   List<Object> get props => [PayTaxe];
// }
