import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileButtonPressed extends ProfileEvent {
  final Users data;
  final File image;

  const ProfileButtonPressed({@required this.data, @required this.image})
      : assert(data != null),
        assert(image != null);

  @override
  List<Object> get props => [image, data];
}
