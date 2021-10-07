import 'package:bloc/bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/add_article_bloc/add_article_event.dart';
import 'package:e_commerce/optimus_lib/bloc/add_article_bloc/add_article_state.dart';
import 'package:e_commerce/optimus_lib/data/repository/provider.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article_response.dart';
import 'package:e_commerce/optimus_lib/utils/setup_locator.dart';

class AddArticleBloc extends Bloc<AddArticleEvent, AddArticleState> {
  get _api => locator.get<Provider>();
  AddArticleBloc() : super(AddArticleInitial());

  @override
  Stream<AddArticleState> mapEventToState(AddArticleEvent event) async* {
    if (event is AddArticleButtonPressed)
      yield* _mapAddArticleButtonPressedToState(event);
  }

  Stream<AddArticleState> _mapAddArticleButtonPressedToState(
      AddArticleButtonPressed event) async* {
    try {
      yield AddArticleInProgress();
      ListeArticles addArticle = await _api.addArticle(
        file1: event.image1,
        file2: event.image2,
        file3: event.image3,
        articleData: event.data,
      );
      if (addArticle.status == 201) {
        yield AddArticleSuccess(data: addArticle);
      } else {
        yield AddArticleFailure(message: addArticle.message);
        return;
      }
    } catch (error, stackTrace) {
      yield AddArticleFailure(message: error);
      print(
          'SignUpBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
