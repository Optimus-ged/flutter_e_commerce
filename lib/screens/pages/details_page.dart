import 'package:e_commerce/exports/all_exports.dart';

class DetailPage extends StatefulWidget {
  final Article data;
  DetailPage({this.data});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int curentIndex;
  PageController _pageviewController;
  bool choice1 = false;
  bool choice2 = false;
  bool choice3 = true;
  LocalArticleBloc get _localArticleBloc => locator.get<LocalArticleBloc>();

  @override
  void initState() {
    curentIndex = 0;
    choice1 = false;
    choice2 = false;
    choice3 = true;
    _pageviewController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return StreamBuilder<List<LocalArticle>>(
        stream: _localArticleBloc.subject,
        builder: (context, snapshot) {
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
                        _buildPageView(screen, data: widget.data.photoArticles),
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
                            "${widget.data.designation}",
                            // "${snapshot.data.length}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white54,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
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
                                      choice1 = true;
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
                                      choice2 = true;
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
                                      choice3 = true;
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
                          height: screen.height * .27,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  "${widget.data.aPropos}",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: Text(
                            "Prix : ${widget.data.pu}\$",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 17,
                              height: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: ClickAnimation(
                            onTap: () {
                              _addToChart(widget.data);
                            },
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
        });
  }

  Widget _buildChoice({Color color, bool isCliked, VoidCallback onTap}) {
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

  Widget _buildPageView(Size screen, {List<PhotoArticles> data}) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: screen.height * .45,
        width: screen.width,
        alignment: Alignment.bottomCenter,
        color: AppTheme.whiteColor,
        child: PageView.builder(
          controller: _pageviewController,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.bottomCenter,
            child: CustomCashedImage(
              imageUrl: "${Endpoint.uplaod}${data[index].photoArticle}",
              screen: screen,
            ),
          ),
          itemCount: 3,
          onPageChanged: (value) {
            curentIndex = value;
            setState(() {});
          },
        ),
      ),
    );
  }

  _addToChart(Article data) {
    final _article = LocalArticle(
      id: data.id,
      photo: data.photoArticles[0].photoArticle,
      designation: data.designation,
      pu: data.pu,
      qte: 1,
    );
    _localArticleBloc..addLocalArticle(data: _article);
  }
}
