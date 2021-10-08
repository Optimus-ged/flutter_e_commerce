import 'package:bloc/bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/login_bloc/login_event.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  get _api => locator.get<Provider>();
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
      final login = await _api.loginUser(event.email, event.password);
      if (login.status == 200) {
        yield LoginSuccess(login: login);
        await locator.get<SharedPreferencesHelper>().saveAuthToken(login.token);
      } else {
        yield LoginFailure(login: login.message);
        return;
      }
    } catch (error, stackTrace) {
      yield LoginFailure(login: "$error");
      print(
          'LoginBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
