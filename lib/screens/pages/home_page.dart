import 'package:e_commerce/bloc/user_bloc/article_bloc.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token;
  ScrollController _scrollController;
  @override
  void initState() {
    token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJPcHRpbXVzIHlhbGEiLCJpZCI6NCwiaWF0IjoxNjIxNzA1NDY2LCJleHAiOjE2MjE5NjQ2NjZ9.lzJ5ogGXEkLbkZVZIyUqfSwZbuePqJLy0a-JMq8Xk2k";
    _scrollController = ScrollController();
    listArticleBloc..getArticles(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.whiteColor,
      systemNavigationBarColor: Colors.white.withOpacity(0.93),
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: StreamBuilder<ListeArticles>(
          stream: listArticleBloc.subject.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      child: GridView.builder(
                        padding: EdgeInsets.only(
                          bottom: 70,
                          top: 30,
                          left: 10,
                          right: 10,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2,
                          childAspectRatio: 0.60,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ClickAnimation(
                            onTap: () => Navigator.of(context).pushNamed(
                              Details,
                              arguments: snapshot.data.articles[index],
                            ),
                            child: Column(
                              crossAxisAlignment: (index % 2 == 0)
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppTheme.radiantTopRight,
                                        AppTheme.radiantTop,
                                        AppTheme.radiantBotom
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${Endpoint.uplaod}${snapshot.data.articles[index].photoArticles[0].photoArticle}",
                                      height: screen.height * .32,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "${snapshot.data.articles[index].designation}",
                                  style: TextStyle(
                                      color: AppTheme.designationColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "${snapshot.data.articles[index].pu}\$",
                                  style: TextStyle(
                                    color: AppTheme.puColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            return GridView.builder(
              padding: EdgeInsets.only(
                bottom: 70,
                top: 30,
                left: 10,
                right: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 0.60,
              ),
              // primary: false,
              // shrinkWrap: true,
              controller: _scrollController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildLoadingWidget(index: index, screen: screen);
              },
            );
          },
        ),

        // floatingActionButton: AnimatedBuilder(
        //   animation: _scrollController,
        //   builder: (context, child) {
        //     return AnimatedContainer(
        //       height: _scrollController.position.userScrollDirection ==
        //               ScrollDirection.reverse
        //           ? 0
        //           : 100,
        //       child: child,
        //       duration: Duration(milliseconds: 300),
        //     );
        //   },
        //   child: _buildNavigation(),
        // ),
        floatingActionButton: _buildNavigation(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildNavigation() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            // Top Shadow
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              blurRadius: 5,
              offset: Offset(0, -5),
            ),
            // Botom shadoow
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavigationItem(
              icon: Icons.shopping_basket_outlined,
              context: context,
            ),
            _buildNavigationItem(
              icon: Icons.search,
              context: context,
              onTap: () => Navigator.of(context).pushNamed(
                Search,
                arguments: {"hint": "Sa marche"},
              ),
            ),
            _buildNavigationItem(
              icon: Icons.exit_to_app,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem(
      {IconData icon, VoidCallback onTap, @required BuildContext context}) {
    return ClickAnimation(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Icon(icon, color: AppTheme.lessWhiteColor),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget({int index, Size screen}) {
    return Shimmer.fromColors(
      baseColor: AppTheme.radiantBotom,
      highlightColor: AppTheme.radiantTop,
      period: Duration(seconds: 3),
      child: Column(
        crossAxisAlignment: (index % 2 == 0)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Container(
            height: screen.height * .32,
            width: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.radiantTopRight,
                  AppTheme.radiantTop,
                  AppTheme.radiantBotom
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 4),
          Container(
            color: AppTheme.greyColor,
            height: 12,
            width: screen.width * .35,
          ),
          SizedBox(height: 2),
          Container(
            color: AppTheme.greyColor,
            height: 15,
            width: screen.width * .10,
          ),
        ],
      ),
    );
  }
}
