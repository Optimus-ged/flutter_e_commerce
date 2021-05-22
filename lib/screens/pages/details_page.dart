import 'package:e_commerce/exports/all_exports.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int curentIndex;
  PageController pageViewController;
  bool choice1 = false;
  bool choice2 = false;
  bool choice3 = true;

  @override
  void initState() {
    curentIndex = 0;
    choice1 = false;
    choice2 = false;
    choice3 = true;
    pageViewController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: screen.height * .45,
              width: screen.width,
              color: AppTheme.whiteColor,
              child: Stack(
                children: [
                  PageViewWidget(
                    curentIndex,
                    pageViewController,
                    onPageChanged: (value) {
                      curentIndex = value;
                      setState(() {});
                    },
                    color: AppTheme.whiteColor,
                    height: screen.height * .45,
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        "$curentIndex jjj",
                        style: TextStyle(
                          fontSize: 100,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  PageviewIndicator(curentIndex),
                  BackwardButton(color: AppTheme.blueColor),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screen.height * .55,
              width: screen.width,
              decoration: BoxDecoration(
                color: AppTheme.blueColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      "Robe Coat",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: SizedBox(
                      width: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildChoice(
                            color: AppTheme.lessPinkColor,
                            isCliked: choice1,
                            onTap: () {
                              setState(() {
                                choice1 = !choice1;
                                choice2 = false;
                                choice3 = false;
                              });
                            },
                          ),
                          _buildChoice(
                            color: AppTheme.yellowColor,
                            isCliked: choice2,
                            onTap: () {
                              setState(() {
                                choice2 = !choice2;
                                choice1 = false;
                                choice3 = false;
                              });
                            },
                          ),
                          _buildChoice(
                            color: AppTheme.pinkColor,
                            isCliked: choice3,
                            onTap: () {
                              setState(() {
                                choice3 = !choice3;
                                choice1 = false;
                                choice2 = false;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: screen.height * .33,
                    child: Text(
                      "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, reiciendis saepe ad perspiciatis cum iste illum molestiae minima voluptatem eos sint cupiditate eligendi accusamus perferendis velit eaque et! Provident, aut Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, reiciendis saepe ad perspiciatis cum iste illum molestiae minima voluptatem eos sint cupiditate eligendi accusamus perferendis velit eaque et! Provident, aut",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: ClickAnimation(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.pinkColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: AppTheme.whiteColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Ajouter au pannier",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screen.height * .52,
            right: 50,
            child: Material(
              elevation: 10,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: ClickAnimation(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppTheme.pinkColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildChoice({Color color, bool isCliked, VoidCallback onTap}) {
    return ClickAnimation(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          child: CircleAvatar(
            backgroundColor:
                isCliked ? AppTheme.whiteColor : Colors.transparent,
            radius: 8,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 7,
            ),
          ),
        ),
      ),
    );
  }

  _buildPageView() {
    return PageView.builder(
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
    );
  }
}
