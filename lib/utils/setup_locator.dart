import 'package:e_commerce/bloc/article_bloc/favorite_article_bloc.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:dio/dio.dart';

final locator = GetIt.I;

void setup() async {
  // Initializing shared preferences helper class
  SharedPreferencesHelper sharedPreferencesHelper =
      await SharedPreferencesHelper.getInstance();

  // All module instances
  locator.registerLazySingleton<ListeArticleBloc>(() => ListeArticleBloc());
  locator.registerLazySingleton<LocalArticleBloc>(() => LocalArticleBloc());
  locator
      .registerLazySingleton<FavoriteArticleBloc>(() => FavoriteArticleBloc());
  // locator.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
  locator.registerLazySingleton<UserListBloc>(() => UserListBloc());
  locator.registerLazySingleton<Provider>(() => Provider());
  locator.registerLazySingleton<SharedPreferencesHelper>(
    () => sharedPreferencesHelper,
  );
}
