import 'package:e_commerce/views/shared/shared_index.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  get _api => locator.get<DataRepository>();
  UpdateProfileBloc() : super(UpdateProfileInitial());

  @override
  Stream<UpdateProfileState> mapEventToState(UpdateProfileEvent event) async* {
    if (event is UpdateProfileButtonPressed)
      yield* _mapUpdateProfileButtonPressedToState(event);
  }

  Stream<UpdateProfileState> _mapUpdateProfileButtonPressedToState(
      UpdateProfileButtonPressed event) async* {
    try {
      yield UpdateProfileInProgress();
      final updateProfile =
          await _api.updateContribuable(event.submitData, event.id, event.file);
      if (updateProfile.status == 200) {
        yield UpdateProfileSuccess(updateProfile: updateProfile);
      } else {
        yield UpdateProfileFailure(updateProfile: updateProfile.message);
      }
    } catch (error, stackTrace) {
      yield UpdateProfileFailure(updateProfile: "Veuillez verrifier votre connection");
      print(
          'UpdateProfileBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
