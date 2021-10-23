import 'package:e_commerce/bloc/enterprise/get_enterprise/get_all_enterprise_bloc.dart';
import 'package:e_commerce/utils/observer.dart';
import 'package:e_commerce/views/shared/shared_index.dart';
import 'app.dart';
import 'utils/setup_locator.dart';
import './views/shared/local_notification.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager.executeTask((taskName, inputData) async {
    NotificationService().showNotification(
      1,
      "Optimus test",
      "Specifies an Android ndroid ",
      10,
    );
    return Future.value(true);
  });
}

void main() async {
  try {
    Bloc.observer = SimpleBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
    await Workmanager.initialize(callbackDispatcher);
    await Workmanager.registerPeriodicTask("test_workertask", "test_workertask",
        inputData: {"data1": "value1", "data2": "value2"},
        frequency: Duration(minutes: 15),
        initialDelay: Duration(minutes: 1));
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
            BlocProvider<GetAllEnterpriseBloc>(
              create: (context) => GetAllEnterpriseBloc(),
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
