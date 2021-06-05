import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class LocalArticleBloc {
  BehaviorSubject<List<LocalArticle>> _subject =
      BehaviorSubject<List<LocalArticle>>();
  BehaviorSubject<List<LocalArticle>> get subject => _subject.stream;

  // Declaring a variable from witch we'll read and wright
  List<LocalArticle> _localListArticle;

  /* We put the read data logic in the constructor because we want it
  to execute directly when we call our bloc */
  LocalArticleBloc()  {
    subject.listen((data) {
      _localListArticle = data;
    });
    Future.delayed(Duration(seconds: 0)).then(
      (value) => _subject.sink.add([]),
    );
  }

  // Adding a method to add new article in the local list
  addLocalArticle({LocalArticle data}) {
    _localListArticle.add(data);
    _subject.sink.add(_localListArticle);
  }

  // Adding a method to delete data from the local list
  deleteLocalArticle({int id}) {
    _localListArticle.removeWhere((art) => art.id == id);
    _subject.add(_localListArticle);
  }

  dispose() {
    _subject.close();
  }
}

final localArticleBloc = LocalArticleBloc();
