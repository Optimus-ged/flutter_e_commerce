import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

// Regular expression for the email
final RegExp regExpEmail = RegExp("regular expression goes here");

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
  final validatePwd = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 8) {
        sink.add(password.trim());
      } else {
        sink.addError("Le mot de passe doit avoir 8 carateres au minimum");
      }
    },
  );

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (regExpEmail.hasMatch(email.trim())) {
      sink.add(email.trim());
    } else {
      sink.add("L'addresse email est invalide");
    }
  });

  dispose() {
    _email.close();
    _password.close();
  }
}
