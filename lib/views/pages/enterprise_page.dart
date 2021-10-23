import 'package:e_commerce/bloc/enterprise/get_enterprise/get_all_enterprise_bloc.dart';
import 'package:e_commerce/bloc/enterprise/get_enterprise/get_all_enterprise_state.dart';
import 'package:e_commerce/global/global_objects.dart';
import 'package:e_commerce/model/enterprise/enterprise.dart';
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
  GetAllEnterpriseBloc _getAllEnterpriseBloc;
  bool isLoading = false;

  @override
  void initState() {
    _updateProfileBloc = BlocProvider.of<UpdateProfileBloc>(context);
    _getAllEnterpriseBloc = BlocProvider.of<GetAllEnterpriseBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return BlocListener<GetAllEnterpriseBloc, GetAllEnterpriseState>(
      bloc: _getAllEnterpriseBloc,
      listener: (context, state) {
        // if (state is GetAllEnterpriseInProgress) {
        //   setState(() {
        //     isLoading = true;
        //   });
        // }
        // if (state is GetAllEnterpriseFailure) {
        //   setState(() {
        //     isLoading = false;
        //   });
        //   Fluttertoast.showToast(
        //     msg: "${state.enterpriseData}",
        //     gravity: ToastGravity.TOP,
        //     backgroundColor: Colors.black.withOpacity(0.6),
        //   );
        // }
        // if (state is GetAllEnterpriseSuccess) {
        //   GlobalData.entreprises.clear();
        //   state.enterpriseData.entreprises.forEach((e) {
        //     GlobalData.entreprises.add(_enterpriseItem(context, enterprise: e));
        //   });
        // }
      },
      child: Scaffold(
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
                                    state.updateProfile.contribuable,
                                    screen,
                                  );
                                }
                                return _userInformations(
                                  widget.contribuable,
                                  screen,
                                );
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
                    BlocBuilder<GetAllEnterpriseBloc, GetAllEnterpriseState>(
                        bloc: _getAllEnterpriseBloc,
                        builder: (context, state) {
                          if (state is GetAllEnterpriseSuccess) {
                            return Column(
                              children: GlobalData.entreprises,
                            );
                          }
                          return Column(
                            children: [
                              SizedBox(height: screen.height / 2.8),
                              Text(
                                'chargement...',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomTheme.orangeColor,
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _enterpriseItem(BuildContext context, {Enterprise enterprise}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EnterpriseDetail(
              enterprise: enterprise,
            ),
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
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomCashedImage(
                      imageUrl: "$upload/${enterprise.photo}",
                      screen: MediaQuery.of(context).size,
                      isHomePage: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text(
                    "${enterprise.description} ",
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
