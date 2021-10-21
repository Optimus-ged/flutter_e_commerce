part of 'pay_taxe_bloc.dart';

@immutable
abstract class PayTaxeState extends Equatable  {
  final int duration;

  const PayTaxeState(this.duration);

  @override
  List<Object> get props => [duration];
}

class PayTaxeInitial extends PayTaxeState {
  const PayTaxeInitial(int duration) : super(duration);
}

class PayTaxeInProgress extends PayTaxeState {
  const PayTaxeInProgress(int duration) : super(duration);
}

class PayTaxeFailure extends PayTaxeState {
  final int status;

  const PayTaxeFailure({this.status}) : super(0);

  @override
  List<Object> get props => [status];
}

class PayTaxeRestart extends PayTaxeState {
  const PayTaxeRestart(int duration) : super(0);
}

// class PayTaxeSuccess extends PayTaxeState {
//   final PayTaxeData PayTaxe;

//   const PayTaxeSuccess({@required this.PayTaxe}) : super(0);

//   @override
//   List<Object> get props => [PayTaxe];
// }
