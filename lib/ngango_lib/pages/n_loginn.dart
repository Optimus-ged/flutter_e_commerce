import 'package:flutter/material.dart';

class Nloginn extends StatelessWidget {
  const Nloginn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: screen.height * .40,
            left: 40,
            right: 40,
          ),
          height: screen.height,
          width: screen.width,
          child: Column(
            children: [
              Text('Login'),
              Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'username',
                        ),
                      ),
                    ),
                    Divider()
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'mot de passe',
                        ),
                      ),
                    ),
                    Divider()
                  ],
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('Connection'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
