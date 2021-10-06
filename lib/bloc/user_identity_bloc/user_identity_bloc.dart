import 'package:bloc/bloc.dart';
import 'package:e_commerce/bloc/user_identity_bloc/user_identity_event.dart';
import 'package:e_commerce/bloc/user_identity_bloc/user_identity_state.dart';
import 'package:e_commerce/data/repository/provider.dart';
import 'package:e_commerce/model/user_model/user_response.dart';
import 'package:e_commerce/utils/setup_locator.dart';

class UserIdentityBloc extends Bloc<UserIdentityEvent, UserIdentityState> {
  get _api => locator.get<Provider>();
  UserIdentityBloc() : super(UserIdentityInitial());

  @override
  Stream<UserIdentityState> mapEventToState(UserIdentityEvent event) async* {
    if (event is LoadUserIdentity)
      yield* _mapUserIdentityButtonPressedToState(event);
  }

  Stream<UserIdentityState> _mapUserIdentityButtonPressedToState(
      LoadUserIdentity event) async* {
    try {
      yield UserIdentityInProgress();
      IdentityResponse userIdentity = await _api.getOneUser(event.userId);
      if (userIdentity.status == 200) {
        yield UserIdentitySuccess(userResponse: userIdentity);
      } else {
        yield UserIdentityFailure(message: 'echec');
        return;
      }
    } catch (error, stackTrace) {
      yield UserIdentityFailure(message: '$error');
      print(
        'UserIdentityBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace',
      );
      return;
    }
  }
}
