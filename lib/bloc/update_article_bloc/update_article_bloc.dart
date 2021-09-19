import 'package:bloc/bloc.dart';
import 'package:e_commerce/bloc/update_article_bloc/update_article_event.dart';
import 'package:e_commerce/bloc/update_article_bloc/update_article_state.dart';
import 'package:e_commerce/data/repository/provider.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/utils/setup_locator.dart';

class UpdateArticleBloc extends Bloc<UpdateArticleEvent, UpdateArticleState> {
  get _api => locator.get<Provider>();
  UpdateArticleBloc() : super(UpdateArticleInitial());

  @override
  Stream<UpdateArticleState> mapEventToState(UpdateArticleEvent event) async* {
    if (event is UpdateArticleButtonPressed)
      yield* _mapAddArticleButtonPressedToState(event);
  }

  Stream<UpdateArticleState> _mapAddArticleButtonPressedToState(
      UpdateArticleButtonPressed event) async* {
    try {
      yield UpdateArticleInProgress();
      ListeArticles updateArticle = await _api.addArticle(
       
        articleData: event.data,
      );
      if (updateArticle.status == 201) {
        yield UpdateArticleSuccess(data: updateArticle);
      } else {
        yield UpdateArticleFailure(message: updateArticle.message);
        return;
      }
    } catch (error, stackTrace) {
      yield UpdateArticleFailure(message: error);
      print(
          'UpdateArticleBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
