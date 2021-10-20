import 'package:e_commerce/utils/observer.dart';
import 'package:e_commerce/views/shared/shared_index.dart';
import 'utils/setup_locator.dart';
import 'app.dart';

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
            BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
            BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
            BlocProvider<UpdateProfileBloc>(
              create: (context) => UpdateProfileBloc(),
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
