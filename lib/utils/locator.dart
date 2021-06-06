import 'package:e_commerce/exports/all_exports.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => ListeArticleBloc());
  locator.registerLazySingleton(() => LocalArticleBloc());
  locator.registerLazySingleton(() => SignUpBloc());
  locator.registerLazySingleton(() => UserListBloc());
}
