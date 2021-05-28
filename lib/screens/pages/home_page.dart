import 'package:e_commerce/bloc/user_bloc/article_bloc.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/routes/routes_constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token;
  @override
  void initState() {
    token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJPcHRpbXVzIHlhbGEiLCJpZCI6NCwiaWF0IjoxNjIxNzA1NDY2LCJleHAiOjE2MjE5NjQ2NjZ9.lzJ5ogGXEkLbkZVZIyUqfSwZbuePqJLy0a-JMq8Xk2k";
    listArticleBloc..getArticles(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.whiteColor,
      systemNavigationBarColor: AppTheme.whiteColor,
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
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ClickAnimation(
                            onTap: () => Navigator.of(context).pushNamed(
                              Details,
                              arguments: snapshot.data.articles[index],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    border: Border.all(
                                        width: 0.2, color: Colors.black12),
                                  ),
                                  child: Image.network(
                                    "${Endpoint.uplaod}${snapshot.data.articles[index].photoArticles[0].photoArticle}",
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "${snapshot.data.articles[index].designation}",
                                  style: TextStyle(
                                      color: AppTheme.designationColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "${snapshot.data.articles[index].pu}\$",
                                  style: TextStyle(
                                      color: AppTheme.puColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
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
            return Center(
              child: CircularProgressIndicator(strokeWidth: 1),
            );
          },
        ),
        floatingActionButton: Material(
          elevation: 20,
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
          child: Container(
            height: 60,
            color: Colors.transparent,
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  _buildNavigationItem(
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
}
