import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UserIdentityEvent extends Equatable {
  const UserIdentityEvent();

  @override
  List<Object> get props => [];
}

class LoadUserIdentity extends UserIdentityEvent {
  final int userId;

  const LoadUserIdentity({@required this.userId});

  @override
  List<Object> get props => [userId];
}
