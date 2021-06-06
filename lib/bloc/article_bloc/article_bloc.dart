import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class ListeArticleBloc {
  BehaviorSubject<ListeArticles> _subject = BehaviorSubject<ListeArticles>();
  BehaviorSubject<ListeArticles> get subject => _subject;

  // Declaring getters to access object instances
  Repository get _repository => locator.get<Repository>();
  SharedPreferencesHelper get _preferences =>
      locator.get<SharedPreferencesHelper>();

  // Get data function
  getArticles() async {
    // await _preferences.saveAuthToken(
    //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJPcHRpbXVzIHlhbGEiLCJpZCI6NCwiaWF0IjoxNjIxNzA1NDY2LCJleHAiOjE2MjE5NjQ2NjZ9.lzJ5ogGXEkLbkZVZIyUqfSwZbuePqJLy0a-JMq8Xk2k");
    String _token = await _preferences.authToken;
    ListeArticles _response = await _repository.getArticles(_token);
    Future.delayed(Duration(milliseconds: 1500)).then(
      (value) => _subject.sink.add(_response),
    );
  }

  dispose() {
    _subject.close();
  }
}
