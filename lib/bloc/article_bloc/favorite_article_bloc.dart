import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteArticleBloc {
  var _subject = BehaviorSubject<List<LocalArticle>>();
  get subject => _subject.stream;

  // Declaring a variable from witch we'll read and wright
  List<LocalArticle> _favoriteListArticle;

  // Get Data
  getFavoriteArticle() async {
    // print('AAAAAAAAAAAAAAAAAAAAAAAAAAAA XXXXXXXXXXXXXXX DDDDDDDDDDDDDDDD');
    subject.listen((data) {
      _favoriteListArticle = data;
    });
    Future.delayed(Duration(milliseconds: 500)).then(
      (value) => _subject.sink.add([]),
    );
  }

  // Adding a method to add new article in the local list
  int addFavoriteArticle({LocalArticle data}) {
    // int status = 400;
    int status;
    if (_favoriteListArticle.every((v) => v.id != data.id)) {
      status = 200;
      _favoriteListArticle.add(data);
      _subject.sink.add(_favoriteListArticle);
    } else {
      status = 400;
    }
    return status;
  }

  // Adding a method to delete data from the local list
  int deleteFavoriteArticle({int id}) {
    int status = 200;
    _favoriteListArticle.removeWhere((art) => art.id == id);
    _subject.add(_favoriteListArticle);
    return status;
  }

  // Updating existing data
  updateFavoriteArticle({LocalArticle data}) {
    final index = _favoriteListArticle.indexOf(
      _favoriteListArticle.where((art) => art.id == data.id).first,
    );

    _favoriteListArticle[index] = data;
    _subject.sink.add(_favoriteListArticle);
  }

  dispose() {
    _subject.close();
  }
}
