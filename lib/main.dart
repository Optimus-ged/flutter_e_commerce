import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

// To remove the glow on the whole application, you can add it right under MaterialApp :
// MaterialApp(
//   builder: (context, child) {
//     return ScrollConfiguration(
//       behavior: MyBehavior(),
//       child: child,
//     );
//   },
//   home: new MyHomePage(),
// );

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test listview"),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child: Text(
                "$index",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Test extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
