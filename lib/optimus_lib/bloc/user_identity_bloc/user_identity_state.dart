import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UserIdentityState extends Equatable {
  const UserIdentityState();

  @override
  List<Object> get props => [];
}

class UserIdentityInitial extends UserIdentityState {}

class UserIdentityInProgress extends UserIdentityState {}

class UserIdentityFailure extends UserIdentityState {
  final String message;

  const UserIdentityFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class UserIdentitySuccess extends UserIdentityState {
  final IdentityResponse userResponse;

  const UserIdentitySuccess({@required this.userResponse});

  @override
  List<Object> get props => [userResponse];
}
