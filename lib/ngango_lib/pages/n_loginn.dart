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
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  decoration: BoxDecoration(
                    color: Color(0xffAA000A),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('Connection', style: TextStyle(color: Colors.white,),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
