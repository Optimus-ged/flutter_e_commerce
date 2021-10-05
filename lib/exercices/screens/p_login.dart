import 'package:e_commerce/exercices/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PLogin extends StatefulWidget {
  const PLogin({Key key}) : super(key: key);

  @override
  _PLoginState createState() => _PLoginState();
}

class _PLoginState extends State<PLogin> {
  var _username = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var doLogin = () {
      auth.loginUser(_username.text, _password.text).then(
            (response) => print(
              'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA $response',
            ),
          );
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('test login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 55,
                child: TextField(
                  controller: _username,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: 'username'),
                ),
              ),
              SizedBox(height: 80),
              Container(
                height: 55,
                child: TextField(
                  controller: _password,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: 'password'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
