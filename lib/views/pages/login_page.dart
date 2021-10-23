import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/model/models_index.dart';
import 'package:e_commerce/views/pages/pages_index.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  LoginBloc _loginBloc;
  SignupBloc _signupBloc;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _signupBloc = BlocProvider.of<SignupBloc>(context);
    _usernameCtrl = TextEditingController(text: 'Yala ged');
    _passwordCtrl = TextEditingController(text: 'yala');
    super.initState();
  }

  var _usernameCtrl = TextEditingController();
  var _passwordCtrl = TextEditingController();

  bool isPassword = true;
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Principal(
                  contribuable: state.login.contribuable,
                ),
              ),
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screen.height,
                  padding: EdgeInsets.only(top: 200, left: 40, right: 40),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<SignupBloc, SignupState>(
                          bloc: _signupBloc,
                          builder: (context, state) {
                            if (state is SignupSuccess) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.signupData.contribuable.userName.split(' ').first} !',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: CustomTheme.orangeColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Connectez vous',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Text(
                                'Hey !\nConnectez vous',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        _optionRow(
                          'Vous êtes nouveau ? /',
                          'Créer',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          ),
                        ),
                        SizedBox(height: 80),
                        _loginInput(
                          controller: _usernameCtrl,
                          color: CustomTheme.orangeColor,
                          hint: 'nom d\'utilisateur',
                        ),
                        _loginInput(
                          controller: _passwordCtrl,
                          color: CustomTheme.greyColor,
                          hint: 'mot de passe',
                          isPassword: true,
                          isLogin: isLogin,
                          onTap: () {
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },
                        ),
                        _optionRow('Mot de passe oublié ? / ', 'Restaurer'),
                        Expanded(
                          child: !isLoading
                              ? Container(
                                  padding: EdgeInsets.only(bottom: 40),
                                  alignment: Alignment.bottomCenter,
                                  child: Material(
                                    elevation: 4,
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      height: 50,
                                      width: screen.width,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: CustomTheme.redColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: InkWell(
                                        onTap: () => _loginBtnPressed(),
                                        child: Text(
                                          'Connection',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'chargement...',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: CustomTheme.orangeColor,
                                    ),
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _optionRow(String title, String btnTitle, {VoidCallback onTap}) {
    return Row(
      children: [
        Text('$title', style: TextStyle(color: Colors.grey, fontSize: 12)),
        InkWell(
          onTap: onTap,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '$btnTitle',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              ),
            ),
          ),
        )
      ],
    );
  }

  _loginInput(
      {Color color,
      String hint,
      bool isPassword = false,
      bool isLogin = false,
      VoidCallback onTap,
      TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 55,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15, right: !isPassword ? 15 : 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isLogin,
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration.collapsed(
                  hintText: '$hint',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            if (isPassword)
              InkWell(
                onTap: onTap,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  _loginBtnPressed() {
    LoginSubmit _data = LoginSubmit(
      username: _usernameCtrl.text,
      password: _passwordCtrl.text,
    );
    _loginBloc.add(LoginButtonPressed(submitData: _data));
  }
}
