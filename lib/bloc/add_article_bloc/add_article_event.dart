import 'package:e_commerce/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AddArticleEvent extends Equatable {
  const AddArticleEvent();

  @override
  List<Object> get props => [];
}

class AddArticleButtonPressed extends AddArticleEvent {
  final Article data;
  final File image1;
  final File image2;
  final File image3;

  const AddArticleButtonPressed(
      {@required this.data,
      @required this.image1,
      @required this.image2,
      @required this.image3});

  @override
  List<Object> get props => [image1, image2, image3, data];
}
