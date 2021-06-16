import 'package:e_commerce/exports/all_exports.dart';

final locator = GetIt.I;

void setup() async {
  // Initializing shared preferences helper class
  SharedPreferencesHelper sharedPreferencesHelper =
      await SharedPreferencesHelper.getInstance();

  // All module instances
  locator.registerLazySingleton<ListeArticleBloc>(() => ListeArticleBloc());
  locator.registerLazySingleton<LocalArticleBloc>(() => LocalArticleBloc());
  locator.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
  locator.registerLazySingleton<UserListBloc>(() => UserListBloc());
  locator.registerLazySingleton<Repository>(() => Repository());
  locator.registerLazySingleton<SharedPreferencesHelper>(
    () => sharedPreferencesHelper,
  );
}
