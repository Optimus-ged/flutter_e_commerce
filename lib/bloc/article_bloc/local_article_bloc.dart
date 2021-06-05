import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class LocalArticleBloc {
  BehaviorSubject<List<LocalArticle>> _subject =
      BehaviorSubject<List<LocalArticle>>();
  BehaviorSubject<List<LocalArticle>> get subject => _subject.stream;

  // Declaring a variable from witch we'll read and wright
  List<LocalArticle> _localListArticle;

  LocalArticleBloc() {
    subject.listen((data) {
      _localListArticle = data;
    });
  }

  // Adding a method to add new article in the local list
  addLocalArticle(LocalArticle data) {
    _localListArticle.add(data);
    _subject.sink.add(_localListArticle);
  }

  dispose() {
    _subject.close();
  }
}
