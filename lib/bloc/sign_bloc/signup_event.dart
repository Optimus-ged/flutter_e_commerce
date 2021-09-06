import 'package:e_commerce/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpButtonPressed extends SignUpEvent {
  final Users data;
  final File image;

  const SignUpButtonPressed({@required this.data, @required this.image})
      : assert(data != null),
        assert(image != null);

  @override
  List<Object> get props => [image, data];
}
