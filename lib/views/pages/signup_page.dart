import 'package:e_commerce/model/models_index.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupBloc _signupBloc;
  bool isPassword = true;
  bool isLogin = true;
  bool isConfirm = true;
  bool isLoading = false;

  var _usernameCtrl = TextEditingController();
  var _passwordCtrl = TextEditingController();
  var _numImpotCtrl = TextEditingController();

  @override
  void initState() {
    _numImpotCtrl = TextEditingController(text: '45454545tttyyrrew34343434');
    _signupBloc = BlocProvider.of<SignupBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return BlocListener<SignupBloc, SignupState>(
      bloc: _signupBloc,
      listener: (context, state) {
        if (state is SignupInProgress) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is SignupFailure) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
            msg: "${state.message}",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.black.withOpacity(0.6),
          );
        }
        if (state is SignupSuccess) {
          Fluttertoast.showToast(
            msg: "${state.signupData.message}",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.black.withOpacity(0.6),
          );

          setState(() {
            GlobalData.user = state.signupData.contribuable.userName;
          });
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screen.height,
                padding: EdgeInsets.only(top: 100, left: 40, right: 40),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey !\nInscrivez vous',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 50),
                      _customAvatar(),
                      SizedBox(height: 40),
                      _loginInput(
                        controller: _usernameCtrl,
                        color: CustomTheme.orangeColor,
                        hint: 'nom d\'utilisateur',
                      ),
                      _loginInput(
                        controller: _numImpotCtrl,
                        color: CustomTheme.greyColor,
                        hint: 'numero impot national',
                        isPassword: true,
                        isLogin: isConfirm,
                        onTap: () {
                          setState(() {
                            isConfirm = !isConfirm;
                          });
                        },
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
                      _optionRow(
                        "J'ai deja un compte ? / ",
                        'Se connecter',
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      Expanded(
                        child: !isLoading
                            ? InkWell(
                                onTap: () => _signupBtnPressed(),
                                child: Container(
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
                                      child: Text(
                                        'Inscription',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
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
              ),
            ],
          ),
        ),
      ),
    );
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

  _customAvatar() {
    return Container(
      // color: Colors.green,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          // alignment: Alignment.center,
          // color: Colors.amber,
          width: 150,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomTheme.greyColor,
                      width: 0.1,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/noAvatar.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 15,
                child: InkWell(
                  onTap: () => print('aaaaaaaaa'),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: CustomTheme.redColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      size: 20,
                      color: Colors.white60,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _signupBtnPressed() {
    SignupSubmit _data = SignupSubmit(
      username: _usernameCtrl.text,
      password: _passwordCtrl.text,
      numImpotNational: _numImpotCtrl.text,
    );
    _signupBloc.add(SignupButtonPressed(submitData: _data));
  }
}
