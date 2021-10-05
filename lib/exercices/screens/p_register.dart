import 'package:e_commerce/exercices/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PRegister extends StatefulWidget {
  const PRegister({Key key}) : super(key: key);

  @override
  _PRegisterState createState() => _PRegisterState();
}

class _PRegisterState extends State<PRegister> {
  var _username = TextEditingController();
  var _password = TextEditingController();
  var _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    
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
              ),
              SizedBox(height: 80),
              Container(
                height: 55,
                child: TextField(
                  controller: _confirmPassword,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: 'confirmer'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
