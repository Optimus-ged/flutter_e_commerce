import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class ListeArticleBloc {
  Repository _repository = Repository();
  BehaviorSubject<ListeArticles> _subject = BehaviorSubject<ListeArticles>();

  getArticles(String token) async {
    ListeArticles _response = await _repository.getArticles(token);
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ListeArticles> get subject => _subject;
}

final listArticleBloc = ListeArticleBloc();
