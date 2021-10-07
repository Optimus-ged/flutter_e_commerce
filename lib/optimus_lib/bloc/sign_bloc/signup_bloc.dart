import 'package:bloc/bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/sign_bloc/signup_event.dart';
import 'package:e_commerce/optimus_lib/bloc/sign_bloc/signup_state.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/model/user_model/signup_response.dart';

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
      SignUpResponse signUp =
          await _api.signUp(file: event.image, userData: event.data);
      if (signUp.status == 201) {
        yield SignupSuccess(data: signUp);
      } else {
        yield SignupFailure(data: signUp);
        return;
      }
    } catch (error, stackTrace) {
      print(
          'SignUpBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
