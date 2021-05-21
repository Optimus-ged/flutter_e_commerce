import 'package:e_commerce/exports/all_exports.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int curentIndex;
  AnimationController rippleController;
  Animation<double> rippleAnimation;
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
            Positioned(
              top: 0,
              child: Container(
                height: screen.height,
                width: screen.width,
                color: AppTheme.blueColor,
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: PageView.builder(
                  controller: pageViewController,
                  itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    child: Text(
                      "$index",
                      style: TextStyle(
                        fontSize: 100,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  itemCount: 3,
                  onPageChanged: (value) {
                    curentIndex = value;
                    setState(() {});
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 30,
                width: screen.width,
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => _getIndicator(index),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getIndicator(int pageNumerotation) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: (curentIndex == pageNumerotation) ? 10 : 5,
      width: (curentIndex == pageNumerotation) ? 10 : 5,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: (curentIndex == pageNumerotation)
              ? Color(0xfff1c422)
              : Colors.grey),
      foregroundDecoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5)),
    );
  }
}
