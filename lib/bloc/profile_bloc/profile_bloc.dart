import 'package:bloc/bloc.dart';
import 'package:e_commerce/bloc/profile_bloc/profile_event.dart';
import 'package:e_commerce/bloc/profile_bloc/profile_state.dart';
import 'package:e_commerce/data/repository/provider.dart';
import 'package:e_commerce/model/user_model/signup_response.dart';
import 'package:e_commerce/utils/setup_locator.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  get _api => locator.get<Provider>();
  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileButtonPressed)
      yield* _mapProfileButtonPressedToState(event);
  }

  Stream<ProfileState> _mapProfileButtonPressedToState(
      ProfileButtonPressed event) async* {
    try {
      yield ProfileInProgress();
      SignUpResponse profile =
          await _api.Profile(file: event.image, userData: event.data);
      if (profile.status == 201) {
        yield ProfileSuccess(data: profile);
      } else {
        yield ProfileFailure(data: profile);
        return;
      }
    } catch (error, stackTrace) {
      print(
          'ProfileBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
