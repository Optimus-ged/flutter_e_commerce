import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/user_model/signup_response.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileInProgress extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String data;

  const ProfileFailure({@required this.data});

  @override
  List<Object> get props => [data];
}

class ProfileSuccess extends ProfileState {
  final SignUpResponse data;

  const ProfileSuccess({@required this.data});

  @override
  List<Object> get props => [data];
}
