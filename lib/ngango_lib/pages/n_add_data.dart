import 'package:e_commerce/ngango_lib/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NAddData extends StatelessWidget {
  final int currentTap;
  const NAddData({Key key, @required this.currentTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyAppbar(
              title: 'AJOUTER UN AGENT',
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('chargement...'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
