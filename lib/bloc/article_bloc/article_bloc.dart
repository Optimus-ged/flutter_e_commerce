import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class ListeArticleBloc {
  BehaviorSubject<ListeArticles> _subject = BehaviorSubject<ListeArticles>();
  BehaviorSubject<ListeArticles> get stream => _subject.stream;

  // Get data function
  getArticles() async {
    // await _preferences.saveAuthToken(
    //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJPcHRpbXVzIHlhbGEiLCJpZCI6NCwiaWF0IjoxNjIxNzA1NDY2LCJleHAiOjE2MjE5NjQ2NjZ9.lzJ5ogGXEkLbkZVZIyUqfSwZbuePqJLy0a-JMq8Xk2k");
    String _token = await locator.get<SharedPreferencesHelper>().authToken;
    ListeArticles _response =
        await locator.get<Repository>().getArticles(_token);
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }
}
