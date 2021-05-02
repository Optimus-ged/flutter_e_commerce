import 'package:e_commerce/pages/login_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.grey,
      ),
      home: LoginPage(),
    ),
  );
}

