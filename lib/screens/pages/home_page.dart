import 'package:e_commerce/bloc/article_bloc/favorite_article_bloc.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/routes/routes_constants.dart';
import 'package:e_commerce/screens/pages/favorite_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  ListeArticleBloc get _listArticleBloc => locator.get<ListeArticleBloc>();
  LocalArticleBloc get _localArticleBloc => locator.get<LocalArticleBloc>();
  FavoriteArticleBloc get _favoriteArticleBloc =>
      locator.get<FavoriteArticleBloc>();

  @override
  void initState() {
    _scrollController = ScrollController();
    _listArticleBloc.getArticles();
    _localArticleBloc.getLocalData();
    _favoriteArticleBloc.getFavoriteArticle();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppTheme.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(60),
        //   child: Container(
        //     color: Colors.transparent,
        //   ),
        // ),
        body: Stack(
          children: [
            StreamBuilder<ListeArticles>(
              stream: _listArticleBloc.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return BuildArticleList(
                    screen: screen,
                    data: snapshot.data,
                    scrollController: _scrollController,
                  );
                }
                return BuildArticleList(
                  screen: screen,
                  scrollController: _scrollController,
                );
              },
            ),
            // Positioned(
            //   top: 40,
            //   left: 10,
            //   right: 10,
            //   child: _searchBar(screen),
            // )
          ],
        ),
        floatingActionButton: _buildNavigation(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _searchBar(screen) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        return AnimatedContainer(
          height: (_scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse)
              ? 0
              : 55,
          child: child,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      child: Container(
        height: 55,
        width: screen.width,
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
      ),
    );
  }

  Widget _buildNavigation() {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        return AnimatedContainer(
          height: (_scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse)
              ? 0
              : 65,
          child: child,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: AppTheme.blueColor,
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
              StreamBuilder<List<LocalArticle>>(
                stream: _localArticleBloc.subject,
                builder: (context, snapshot) {
                  return _buildNavigationItem(
                    icon: Icons.shopping_basket_outlined,
                    context: context,
                    onTap: () => Navigator.of(context).pushNamed(
                      Payment,
                      arguments: snapshot.data,
                    ),
                  );
                },
              ),
              _buildNavigationItem(
                icon: Icons.search,
                context: context,
                onTap: () {},
              ),
              _buildNavigationItem(
                icon: Icons.favorite,
                context: context,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FavoritePage(),
                    ),
                  );
                },
              ),
              _buildNavigationItem(
                icon: Icons.exit_to_app,
                context: context,
              ),
            ],
          ),
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
          child: Icon(icon, color: AppTheme.whiteColor),
        ),
      ),
    );
  }
}
