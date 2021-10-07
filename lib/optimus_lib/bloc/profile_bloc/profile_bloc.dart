import 'package:bloc/bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/profile_bloc/profile_event.dart';
import 'package:e_commerce/optimus_lib/bloc/profile_bloc/profile_state.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/model/user_model/signup_response.dart';

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
          await _api.updateUser(file: event.image, userData: event.data);
      if (profile.status == 200) {
        yield ProfileSuccess(data: profile);
      } else {
        yield ProfileFailure(data: profile.message);
        return;
      }
    } catch (error, stackTrace) {
      yield ProfileFailure(data: error);
      print(
          'ProfileBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
