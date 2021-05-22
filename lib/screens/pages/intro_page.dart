import 'package:e_commerce/exports/all_exports.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int curentIndex;
  PageController pageViewController;

  @override
  void initState() {
    curentIndex = 0;
    pageViewController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Material(
      child: Container(
        width: screen.width,
        height: screen.height,
        color: AppTheme.blueColor,
        child: Stack(
          children: [
            PageViewWidget(
              curentIndex,
              pageViewController,
              onPageChanged: (value) {
                curentIndex = value;
                setState(() {});
              },
              child: Center(
                child: Text(
                  "$curentIndex",
                  style: TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            PageviewIndicator(curentIndex),
          ],
        ),
      ),
    );
  }
}
