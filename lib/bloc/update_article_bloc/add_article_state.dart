import 'package:e_commerce/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AddArticleState extends Equatable {
  const AddArticleState();

  @override
  List<Object> get props => [];
}

class AddArticleInitial extends AddArticleState {}

class AddArticleInProgress extends AddArticleState {}

class AddArticleFailure extends AddArticleState {
  final String message;

  const AddArticleFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class AddArticleSuccess extends AddArticleState {
  final ListeArticles data;

  const AddArticleSuccess({@required this.data});

  @override
  List<Object> get props => [data];
}
