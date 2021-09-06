import 'package:bloc/bloc.dart';
import 'package:e_commerce/bloc/sign_bloc/signup_event.dart';
import 'package:e_commerce/bloc/sign_bloc/signup_state.dart';
import 'package:e_commerce/data/repository/provider.dart';
import 'package:e_commerce/model/user_model/signup_response.dart';
import 'package:e_commerce/utils/setup_locator.dart';


class SignupBloc extends Bloc<SignUpEvent, SignupState> {
  get _api => locator.get<Provider>();
  SignupBloc() : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed)
      yield* _mapSignUpButtonPressedToState(event);
  }

  Stream<SignupState> _mapSignUpButtonPressedToState(
      SignUpButtonPressed event) async* {
    try {
      yield SignupInProgress();
      SignUpResponse signUp = await _api.signUp(event.image, event.data);
      if (signUp.status == 200) {
        yield SignupSuccess(data: signUp);
      } else {
        yield SignupFailure(data : signUp);
        return;
      }
    } catch (error, stackTrace) {
      print(
          'SignUpBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
