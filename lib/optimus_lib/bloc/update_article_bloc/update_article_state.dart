import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article_response.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UpdateArticleState extends Equatable {
  const UpdateArticleState();

  @override
  List<Object> get props => [];
}

class UpdateArticleInitial extends UpdateArticleState {}

class UpdateArticleInProgress extends UpdateArticleState {}

class UpdateArticleFailure extends UpdateArticleState {
  final String message;

  const UpdateArticleFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class UpdateArticleSuccess extends UpdateArticleState {
  final ListeArticles data;

  const UpdateArticleSuccess({@required this.data});

  @override
  List<Object> get props => [data];
}
