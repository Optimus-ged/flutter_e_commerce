
import 'package:e_commerce/model/models_index.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

@immutable
abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileInProgress extends UpdateProfileState {}

class UpdateProfileFailure extends UpdateProfileState {
  final String updateProfile;

  const UpdateProfileFailure({@required this.updateProfile});

  @override
  List<Object> get props => [updateProfile];
}

class UpdateProfileSuccess extends UpdateProfileState {
  final SignupResponse updateProfile;

  const UpdateProfileSuccess({@required this.updateProfile});

  @override
  List<Object> get props => [updateProfile];
}
