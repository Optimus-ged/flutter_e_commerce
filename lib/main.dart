
import 'package:bloc/bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/add_article_bloc/add_article_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'optimus_lib/bloc/create_paiment_bloc/create_paiement_bloc.dart';
import 'optimus_lib/bloc/login_bloc/login_bloc.dart';
import 'optimus_lib/bloc/profile_bloc/profile_bloc.dart';
import 'optimus_lib/bloc/sign_bloc/signup_bloc.dart';
import 'optimus_lib/bloc/update_article_bloc/update_article_bloc.dart';
import 'optimus_lib/bloc/user_identity_bloc/user_identity_bloc.dart';
import 'optimus_lib/exports/all_exports.dart';
import 'optimus_lib/utils/setup_locator.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    debugPrint('Main.SimpleBlocObserver.OnEvent ::: EVENT: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint(
        'Main.SimpleBlocObserver.OnTransition ::: TRANSITION: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(
      'Main.SimpleBlocObserver.OnError ::: '
      'ERROR: $error & STACKTRACE: $stackTrace',
    );
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
  try {
    Bloc.observer = SimpleBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
    setup();
    await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ],
    ).then(
      (_) => runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
            ),
            BlocProvider<SignupBloc>(
              create: (context) => SignupBloc(),
            ),
            BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(),
            ),
            BlocProvider<AddArticleBloc>(
              create: (context) => AddArticleBloc(),
            ),
            BlocProvider<UpdateArticleBloc>(
              create: (context) => UpdateArticleBloc(),
            ),
            BlocProvider<CreatePaiementBloc>(
              create: (context) => CreatePaiementBloc(),
            ),
            BlocProvider<UserIdentityBloc>(
              create: (context) => UserIdentityBloc(),
            ),
          ],
          child: MyApp(),
        ),
      ),
    );
  } catch (error, stacktrace) {
    debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');
  }
}
