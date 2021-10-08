import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  final String title;
  const MyAppbar({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
        // color: Colors.grey,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black45,
                ),
              ),
            ),
            Center(
              child: Text(
                "TOUS LES AGENTS",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
