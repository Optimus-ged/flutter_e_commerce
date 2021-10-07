import 'package:e_commerce/optimus_lib/exports/all_exports.dart';

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
    Size screen = MediaQuery.of(context).size;
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
                width: screen.width,
                height: screen.height,
                color: AppTheme.blueColor,
                child: PageView.builder(
                  controller: pageViewController,
                  itemBuilder: (context, index) => Center(
                    child: Text(
                      "$curentIndex",
                      style: TextStyle(
                        fontSize: 100,
                        color: Colors.white,
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
            PageviewIndicator(curentIndex),
          ],
        ),
      ),
    );
  }
}
