import 'package:e_commerce/model/models_index.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

class HomePage extends StatefulWidget {
  final Contribuable contribuable;
  const HomePage({Key key, this.contribuable}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UpdateProfileBloc _updateProfileBloc;

  @override
  void initState() {
    _updateProfileBloc = BlocProvider.of<UpdateProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screen.height,
        padding: EdgeInsets.only(top: 24),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 16, right: 40, left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                              bloc: _updateProfileBloc,
                              builder: (context, state) {
                                if (state is UpdateProfileSuccess) {
                                  return Text(
                                    '${state.updateProfile.contribuable.userName.split(' ').first}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    '${widget.contribuable.userName.split(' ').first}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              },
                            ),
                            Text(
                              'Bon retour parmi nous !',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      "lit. Numquam, dignissimos ad. Non corporis consequuntur, neque sapiente id maxime, beatae, incidunt dignissimos repudiandae similique fugit ullam nam vitae delectus nostrum quidem lit. Numquam, dignissimos ad. Non corporis consequuntur, neque sapiente id maxime.",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
