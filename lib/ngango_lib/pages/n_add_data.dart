import 'package:e_commerce/ngango_lib/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NAddData extends StatelessWidget {
  const NAddData({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyAppbar(title: 'AJOUTER UN AGENT')
          ],
        ),
      ),
    );
  }
}