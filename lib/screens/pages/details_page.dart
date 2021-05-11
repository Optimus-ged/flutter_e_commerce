import 'package:e_commerce/exports/all_exports.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool choice1 = false;
  bool choice2 = false;
  bool choice3 = true;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    final Map args = ModalRoute.of(context).settings.arguments;

    // Making choice
    _makeChoice({bool one, two, three}) {
      setState(() {
        one = !one;
        two = false;
        three = false;
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: screen.height * .45,
              width: screen.width,
              child: Stack(
                children: [
                  BackButton(color: AppTheme.blueColor),
                  Center(
                    child: Text(
                      "${args["title"]}",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
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
                              _makeChoice(
                                one: choice1,
                                two: choice2,
                                three: choice3,
                              );
                              // setState(() {
                              //   choice1 = !choice1;
                              //   choice2 = false;
                              //   choice3 = false;
                              // });
                            },
                          ),
                          _buildChoice(
                            color: AppTheme.yellowColor,
                            isCliked: choice2,
                            onTap: () {
                               _makeChoice(
                                one: choice2,
                                two: choice3,
                                three: choice1,
                              );
                              // setState(() {
                              //   choice2 = !choice2;
                              //   choice1 = false;
                              //   choice3 = false;
                              // });
                            },
                          ),
                          _buildChoice(
                            color: AppTheme.pinkColor,
                            isCliked: choice3,
                            onTap: () {
                               _makeChoice(
                                one: choice3,
                                two: choice1,
                                three: choice2,
                              );
                              // setState(() {
                              //   choice3 = !choice3;
                              //   choice1 = false;
                              //   choice2 = false;
                              // });
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
}
