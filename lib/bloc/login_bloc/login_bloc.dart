import 'package:e_commerce/bloc/bloc_index.dart';
import 'package:e_commerce/data/repository/data_repository.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  get _api => locator.get<DataRepository>();
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed)
      yield* _mapLoginButtonPressedToState(event);
  }

  Stream<LoginState> _mapLoginButtonPressedToState(
      LoginButtonPressed event) async* {

    try {
      yield LoginInProgress();
      final login = await _api.loginUser(event.submitData);
      if (login.status == 200) {
        yield LoginSuccess(login: login);
        
      } else {
        yield LoginFailure(login: login.message);
      }
    } catch (error, stackTrace) {
      yield LoginFailure(login: "$error");
      print(
          'LoginBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
