import 'package:e_commerce/bloc/login_bloc/login_bloc.dart';
import 'package:e_commerce/bloc/login_bloc/login_event.dart';
import 'package:e_commerce/bloc/login_bloc/login_state.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/routes/routes_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _controllerNom = TextEditingController();
  var _controllerPassword = TextEditingController();
  bool isLoading;
  LoginBloc _loginBloc;
  User userData;

  @override
  void initState() {
    isLoading = false;
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _controllerNom = TextEditingController(text: 'Optimus yala');
    _controllerPassword = TextEditingController(text: 'optimus');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.blueColor,
      body: BlocListener<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is LoginInProgress) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is LoginFailure) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(
              msg: "${state.login}",
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.black.withOpacity(0.6),
            );
          }
          if (state is LoginSuccess) {
            setState(() {
              userData = state.login.user;
            });
            Fluttertoast.showToast(
              msg: "${state.login.message}",
              gravity: ToastGravity.TOP,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.black.withOpacity(0.6),
            );
            Navigator.of(context).pushReplacementNamed(
              Home,
              arguments: state.login.user,
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (context, state) => ScrollConfiguration(
            behavior: RemoveGlow(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: screen.height * .28,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "UZISHA",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.lessWhiteColor,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: screen.height * .12),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _builTitle(
                          title: "S'inscrire",
                          isActive: false,
                          onTap: () => Navigator.of(context).pushNamed(Signup),
                        ),
                        _buildDivider(),
                        _builTitle(title: "Se connecter", isActive: true),
                      ],
                    ),
                  ),
                  CustomTextField(
                    hint: "Nom d'utilisateur ou telephone",
                    isFirst: true,
                    obscureText: false,
                    top: screen.height * .05,
                    controller: _controllerNom,
                  ),
                  CustomTextField(
                    hint: "Mot de passe",
                    isFirst: false,
                    obscureText: true,
                    controller: _controllerPassword,
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
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            )
                          : Text(
                              "Connexion",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 2),
                  ClickAnimation(
                    onTap: () {},
                    child: Container(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        child: Text(
                          "Mot de passe oublié",
                          style: TextStyle(
                            color: AppTheme.greyColor,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screen.height * .15)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _builTitle({String title, bool isActive, VoidCallback onTap}) {
    return ClickAnimation(
      onTap: onTap,
      child: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "$title",
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.greyColor,
                ),
              ),
            ),
            isActive
                ? Positioned(
                    bottom: 4,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: AppTheme.pinkColor,
                        radius: 2,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 25,
        width: 0.2,
        color: AppTheme.greyColor,
      ),
    );
  }

  Future<void> _onLoginButtonPressed() async {
    String email = _controllerNom.text.trim();
    String password = _controllerPassword.text.trim();

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
