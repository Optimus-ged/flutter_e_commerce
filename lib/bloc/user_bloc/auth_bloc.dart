import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

final RegExp regExpEmail = RegExp("source");

class AuthBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Get Data
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream;
  Stream<bool> get isValid =>
      CombineLatestStream.combine2(email, password, (email, password) => true);

  // Set Data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePwd => _password.sink.add;

  // Stream transformers for validations
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (regExpEmail.hasMatch(data.trim())) {
        sink.add(data.trim());
      } else {
        sink.addError("Addresse email invalide");
      }
    },
  );

  final validatePwd = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 6) {
        sink.add(data.trim());
      } else {
        sink.addError("Le mot de passe doit avoir au moins 6 caracteres");
      }
    },
  );

  dispose() {
    _email.close();
    _password.close();
  }
}
