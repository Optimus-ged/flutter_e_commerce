import 'package:get_it/get_it.dart';
import 'package:e_commerce/data/repository/data_repository.dart';
import 'preferences_helper.dart';

final locator = GetIt.I;

void setup() async {
  // Initializing shared preferences helper class
  SharedPreferencesHelper sharedPreferencesHelper =
      await SharedPreferencesHelper.getInstance();

  // All module instances
  locator.registerLazySingleton<DataRepository>(() => DataRepository());
  locator.registerLazySingleton<SharedPreferencesHelper>(
    () => sharedPreferencesHelper,
  );
}
