import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class ListeArticleBloc {
  Repository _repository = Repository();
  BehaviorSubject<ListeArticles> _subject = BehaviorSubject<ListeArticles>();
  BehaviorSubject<ListeArticles> get subject => _subject;

  getArticles(String token) async {
    ListeArticles _response = await _repository.getArticles(token);
    Future.delayed(Duration(milliseconds: 1500))
        .then((value) => _subject.sink.add(_response));
  }

  dispose() {
    _subject.close();
  }

}

final listArticleBloc = ListeArticleBloc();
