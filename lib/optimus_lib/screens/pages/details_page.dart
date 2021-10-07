import 'package:e_commerce/optimus_lib/bloc/article_bloc/favorite_article_bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/article_bloc/local_article_bloc.dart';
import 'package:e_commerce/optimus_lib/data/repository/end_points/end_points.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article_local.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/backwardButton.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/click_animation.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/custom_btn.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/custom_cached_img.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/pageview_indicator.dart';
import 'package:e_commerce/optimus_lib/utils/app_theme.dart';
import 'package:e_commerce/optimus_lib/utils/setup_locator.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  get _localArticleBloc => locator.get<LocalArticleBloc>();
  get _favoriteArticleBloc => locator.get<FavoriteArticleBloc>();

  @override
  void initState() {
    curentIndex = 0;
    choice1 = false;
    choice2 = false;
    choice3 = true;
    _pageviewController = PageController(initialPage: 0);
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
                        child: CustomButton(
                          onTap: () {
                            _addToChart(widget.data);
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: AppTheme.whiteColor,
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
                    onTap: () {
                      _addFavorite(widget.data);
                    },
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
      },
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

  _buildPageView(Size screen, {List<PhotoArticles> data}) {
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
    final result = _localArticleBloc.addLocalArticle(data: _article);
    if (result == 200) {
      Fluttertoast.showToast(
        msg: "${_article.designation} ajoute au pannier avec succes",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black.withOpacity(0.6),
      );
    } else {
      Fluttertoast.showToast(
        msg:
            "${_article.designation} existe deja dans le pannier, pour modifier la quantite et autre choses, vous pouvez vous rendre au pannier",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black.withOpacity(0.6),
      );
    }
  }

  _addFavorite(Article data) {
    final _article = LocalArticle(
      id: data.id,
      photo: data.photoArticles[0].photoArticle,
      designation: data.designation,
      pu: data.pu,
      qte: 1,
    );

    final result = _favoriteArticleBloc.addFavoriteArticle(data: _article);
    if (result == 200) {
      Fluttertoast.showToast(
        msg: "${_article.designation} ajoute au favoris avec succes",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black.withOpacity(0.6),
      );
    } else {
      Fluttertoast.showToast(
        msg:
            "${_article.designation} existe deja parmis les favoris, pour modifier la quantite et autre choses, vous pouvez vous rendre au pannier",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black.withOpacity(0.6),
      );
    }
  }
}
