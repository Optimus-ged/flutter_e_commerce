import 'package:e_commerce/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UserIdentityEvent extends Equatable {
  const UserIdentityEvent();

  @override
  List<Object> get props => [];
}

class UserIdentityButtonPressed extends UserIdentityEvent {}


// final IdentityResponse userResponse;

//   const UserIdentityButtonPressed({@required this.userResponse});

//   @override
//   List<Object> get props => [userResponse];