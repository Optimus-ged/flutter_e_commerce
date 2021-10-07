import 'package:e_commerce/optimus_lib/data/repository/provider.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article_response.dart';
import 'package:e_commerce/optimus_lib/utils/preferences_helper.dart';
import 'package:e_commerce/optimus_lib/utils/setup_locator.dart';
import 'package:rxdart/rxdart.dart';

class ListeArticleBloc {
  BehaviorSubject<ListeArticles> _subject = BehaviorSubject<ListeArticles>();
  BehaviorSubject<ListeArticles> get stream => _subject.stream;

  // Get data function
  getArticles() async {
    print('AAAAAAAAAAAAAAA');
    // await locator.get<SharedPreferencesHelper>().saveAuthToken(
    //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJPcHRpbXVzIHlhbGEiLCJpZCI6NCwiaWF0IjoxNjIxNzA1NDY2LCJleHAiOjE2MjE5NjQ2NjZ9.lzJ5ogGXEkLbkZVZIyUqfSwZbuePqJLy0a-JMq8Xk2k");
    String _token = await locator.get<SharedPreferencesHelper>().authToken;
    // print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb " + _token);
    ListeArticles _response = await locator.get<Provider>().getArticles(_token);
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }

  addArticle({Article article}) async {}
}
