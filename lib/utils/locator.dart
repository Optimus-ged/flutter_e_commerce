import 'package:e_commerce/exports/all_exports.dart';

final locator = GetIt.I;

void setup() {
  locator.registerLazySingleton<ListeArticleBloc>(() => ListeArticleBloc());
  locator.registerLazySingleton<LocalArticleBloc>(() => LocalArticleBloc());
  locator.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
  locator.registerLazySingleton<UserListBloc>(() => UserListBloc());
}
