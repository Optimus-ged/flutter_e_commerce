import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class ListeArticleBloc {
  Repository _repository = Repository();
  BehaviorSubject<ListeArticles> _subject = BehaviorSubject<ListeArticles>();
  BehaviorSubject<ListeArticles> get subject => _subject;
  SharedPreferencesHelper get _preferences =>
      locator.get<SharedPreferencesHelper>();

  getArticles() async {
    String _token = await _preferences.authToken;
    ListeArticles _response = await _repository.getArticles(_token);
    Future.delayed(Duration(milliseconds: 1500))
        .then((value) => _subject.sink.add(_response));
  }

  dispose() {
    _subject.close();
  }
}

final listArticleBloc = ListeArticleBloc();
