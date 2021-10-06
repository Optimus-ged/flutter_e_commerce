import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/paiement/get_all_paiement.dart';
import 'package:rxdart/rxdart.dart';

class GetPaiementsBloc {
  //BehaviorSubject<AllPaiementsResponse>
  final _subject = BehaviorSubject<AllPaiementsResponse>();
  get stream => _subject.stream;

  // Get data function
  getAllPaiemenst() async {
    // await locator.get<SharedPreferencesHelper>().saveAuthToken(
    //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJPcHRpbXVzIHlhbGEiLCJpZCI6NCwiaWF0IjoxNjIxNzA1NDY2LCJleHAiOjE2MjE5NjQ2NjZ9.lzJ5ogGXEkLbkZVZIyUqfSwZbuePqJLy0a-JMq8Xk2k");
    // String _token = await locator.get<SharedPreferencesHelper>().authToken;
    // print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb " + _token);
    AllPaiementsResponse _response = await locator.get<Provider>().getAllPaiements();
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }
}
