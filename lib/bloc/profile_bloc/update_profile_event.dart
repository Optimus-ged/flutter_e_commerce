import 'dart:io';

import 'package:e_commerce/model/signup/signup_submit.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

@immutable
abstract class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileButtonPressed extends UpdateProfileEvent {
  final ProfileSubmit submitData;
  final String id;
  final File file;

  const UpdateProfileButtonPressed(
      {@required this.submitData, @required this.id, this.file});

  @override
  List<Object> get props => [submitData, id, file];
}
