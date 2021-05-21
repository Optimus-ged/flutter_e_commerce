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
    return SafeArea(
      top: false,
      child: Container(
        color: AppTheme.blueColor,
        child: Stack(
          children: [
            Container(
              color: AppTheme.lessPinkColor,
              padding: EdgeInsets.only(left: 20, right: 20, top: 5),
              child: PageView.builder(
                controller: pageViewController,
                itemBuilder: (context, index) => Container(
                  child: Text(
                    "$index",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.amber,
                    ),
                  ),
                ),
                itemCount: 4,
                onPageChanged: (value) {
                  curentIndex = value;
                  setState(() {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => _getIndicator(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getIndicator(int pageNumerotation) {
    return new AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 7,
        width: (curentIndex == pageNumerotation) ? 20 : 10,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: (curentIndex == pageNumerotation)
                ? Color(0xfff1c422)
                : Colors.grey));
  }
}
