import 'package:e_commerce/exports/all_exports.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  // const ProfilePage({ Key? key }) : super(key: key);
  final User userData;
  ProfilePage(this.userData);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading;
  var _controllerNom = TextEditingController();
  var _controllerContact = TextEditingController();
  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: screen.height,
          width: screen.width,
          color: Colors.grey[50],
          child: Column(
            children: [
              SizedBox(height: 24),
              Container(
                width: screen.width,
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: ClickAnimation(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "PROFILE",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Container(
                    width: screen.width,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: Image.network(
                              "${Endpoint.uplaod}${widget.userData.photo}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        CustomTextField(
                          hint: "${widget.userData.nom}",
                          isFirst: true,
                          obscureText: false,
                          top: screen.height * .05,
                          controller: _controllerNom,
                        ),
                        CustomTextField(
                          hint: "${widget.userData.contact}",
                          isFirst: true,
                          obscureText: false,
                          top: screen.height * .05,
                          controller: _controllerContact,
                        ),
                        SizedBox(height: screen.height * .05),
                        ClickAnimation(
                          onTap: () {
                            _onLoginButtonPressed();
                          },
                          child: Container(
                            height: 38,
                            width: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppTheme.pinkColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: isLoading
                                ? Container(
                                    height: 28,
                                    width: 28,
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Colors.white),
                                    ),
                                  )
                                : Text(
                                    "Modifier",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onLoginButtonPressed() async {
    String email = _controllerNom.text.trim();
    String password = _controllerContact.text.trim();

    if (email.trim().isEmpty || password.trim().isEmpty) {
      Fluttertoast.showToast(
        msg:
            "Certains champs sont encore vide, veuillez les rempir tous SVP !!!",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black.withOpacity(0.6),
      );
    } else {
      _loginBloc.add(LoginButtonPressed(
        email: email,
        password: password,
      ));
    }
  }
}
