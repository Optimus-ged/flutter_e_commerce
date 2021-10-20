import 'package:e_commerce/bloc/bloc_index.dart';
import 'package:e_commerce/data/repository/data_repository.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  get _api => locator.get<DataRepository>();
  SignupBloc() : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupButtonPressed)
      yield* _mapSignupButtonPressedToState(event);
  }

  Stream<SignupState> _mapSignupButtonPressedToState(
      SignupButtonPressed event) async* {
    try {
      yield SignupInProgress();
      final signup = await _api.signupContribuable(event.submitData);
      if (signup.status == 200) {
        yield SignupSuccess(signupData: signup);
      } else {
        yield SignupFailure(message: signup.message);
      }
    } catch (error, stackTrace) {
      yield SignupFailure(message: "$error");
      print(
          'SignupBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
