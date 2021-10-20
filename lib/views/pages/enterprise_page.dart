import 'package:e_commerce/model/models_index.dart';
import 'package:e_commerce/views/shared/custom_cached_img.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

class EnterprisePage extends StatefulWidget {
  final Contribuable contribuable;
  const EnterprisePage({Key key, @required this.contribuable})
      : super(key: key);

  @override
  _EnterprisePageState createState() => _EnterprisePageState();
}

class _EnterprisePageState extends State<EnterprisePage> {
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
                        BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                            bloc: _updateProfileBloc,
                            builder: (context, state) {
                              if (state is UpdateProfileSuccess) {
                                return _userInformations(
                                    state.updateProfile.contribuable, screen);
                              }
                              return _userInformations(
                                  widget.contribuable, screen);
                            }),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomTheme.redColor,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  _enterpriseItem(),
                  _enterpriseItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _enterpriseItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EnterpriseDetail(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: CustomTheme.orangeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        // child: Text('test'),
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text(
                    "Non corporis consequuntur, neque sapiente id maxime, beatae, incidunt dignissimos repudiandae similique fugit ullam nam vitae delectus nostrum quidem lit. Numquam, dignissimos ad.",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _userInformations(Contribuable cont, Size screen) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.st,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage(
              //     'assets/images/noAvatar.png',
              //   ),
              // ),
            ),
            child: CustomCashedImage(
              imageUrl: "$upload/${cont.photo}",
              screen: screen,
              isHomePage: true,
            ),
          ),
        ),
        SizedBox(width: 5),
        Container(
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${cont.userName}',
                style: TextStyle(fontSize: 12),
              ),
              Text('${cont.mailAddresse}', style: TextStyle(fontSize: 12))
            ],
          ),
        ),
      ],
    );
  }
}
