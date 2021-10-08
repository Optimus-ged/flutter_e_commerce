import 'package:e_commerce/ngango_lib/bloc/login_bloc/login_bloc.dart';
import 'package:e_commerce/ngango_lib/bloc/login_bloc/login_state.dart';
import 'package:e_commerce/ngango_lib/pages/n_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Nloginn extends StatefulWidget {
  const Nloginn({Key key}) : super(key: key);

  @override
  _NloginnState createState() => _NloginnState();
}

class _NloginnState extends State<Nloginn> {
  var _controllerNom = TextEditingController();
  var _controllerPassword = TextEditingController();
  bool isLoading;
  LoginBloc _loginBloc;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
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
            Fluttertoast.showToast(
              msg: "${state.login.message}",
              gravity: ToastGravity.TOP,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.black.withOpacity(0.6),
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: screen.height * .50,
              left: 40,
              right: 40,
            ),
            height: screen.height,
            width: screen.width,
            child: Column(
              children: [
                // Text('Login'),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration.collapsed(
                            hintText: 'username',
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider()
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  // color: Colors.green,
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration.collapsed(
                            hintText: 'mot de passe',
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider()
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NMainPage(),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    decoration: BoxDecoration(
                      color: Color(0xffAA000A),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Connection',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
