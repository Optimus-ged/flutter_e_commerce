import 'package:e_commerce/optimus_lib/model/article_model/article.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
