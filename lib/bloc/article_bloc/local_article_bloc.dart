import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class LocalArticleBloc {
  var _subject = BehaviorSubject<List<LocalArticle>>();
  get subject => _subject.stream;

  // Declaring a variable from witch we'll read and wright
  List<LocalArticle> _localListArticle;

  // Get Data
  getLocalData() async {
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAA XXXXXXXXXXXXXXX DDDDDDDDDDDDDDDD');
    subject.listen((data) {
      _localListArticle = data;
    });
    Future.delayed(Duration(milliseconds: 500)).then(
      (value) => _subject.sink.add([]),
    );
  }

  // Adding a method to add new article in the local list
  int addLocalArticle({LocalArticle data}) {
    // int status = 400;
    int status;
    if (_localListArticle.every((v) => v.id != data.id)) {
      status = 200;
      _localListArticle.add(data);
      _subject.sink.add(_localListArticle);
    } else {
      status = 400;
    }
    return status;
  }

  // Adding a method to delete data from the local list
  int deleteLocalArticle({int id}) {
    int status = 200;
    _localListArticle.removeWhere((art) => art.id == id);
    _subject.add(_localListArticle);
    return status;
  }

  // Updating existing data
  updateLocalArticle({LocalArticle data}) {
    final index = _localListArticle.indexOf(
      _localListArticle.where((art) => art.id == data.id).first,
    );

    _localListArticle[index] = data;
    _subject.sink.add(_localListArticle);
  }

  dispose() {
    _subject.close();
  }
}
