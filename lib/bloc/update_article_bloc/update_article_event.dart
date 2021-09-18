import 'package:e_commerce/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UpdateArticleEvent extends Equatable {
  const UpdateArticleEvent();

  @override
  List<Object> get props => [];
}

class UpdateArticleButtonPressed extends UpdateArticleEvent {
  final Article data;


  const UpdateArticleButtonPressed(
      {@required this.data
     });

  @override
  List<Object> get props => [data];
}
