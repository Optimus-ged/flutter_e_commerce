import 'package:e_commerce/optimus_lib/bloc/article_bloc/favorite_article_bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/user_identity_bloc/user_identity_bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/user_identity_bloc/user_identity_event.dart';
import 'package:e_commerce/optimus_lib/bloc/user_identity_bloc/user_identity_state.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/screens/pages/favorite_page.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Users userIdentity;
  ScrollController _scrollController;
  UserIdentityBloc _userIdentityBloc;
  var _searchController = TextEditingController();
  bool showSearchbar;
  ListeArticleBloc get _listArticleBloc => locator.get<ListeArticleBloc>();
  LocalArticleBloc get _localArticleBloc => locator.get<LocalArticleBloc>();
  FavoriteArticleBloc get _favoriteArticleBloc =>
      locator.get<FavoriteArticleBloc>();
  List<Article> listArticles = [];
  List<Widget> widgetList = [];
  int test = 0;

  @override
  void initState() {
    // listArticles = [];
    userIdentity = Users();
    widgetList = [];
    _scrollController = ScrollController();
    _userIdentityBloc = BlocProvider.of<UserIdentityBloc>(context)
      ..add(
        LoadUserIdentity(
          userId: widget.user.id,
        ),
      );
    _listArticleBloc.getArticles();
    _localArticleBloc.getLocalData();
    _favoriteArticleBloc.getFavoriteArticle();
    showSearchbar = false;
    _searchController.addListener(() {
      filterList();
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  filterList({
    List<Article> allArticles,
  }) {
    allArticles = [];
    allArticles.addAll(listArticles);
    widgetList = [];
    if (_searchController.text.isNotEmpty) {
      allArticles.retainWhere(
        (article) {
          return article.designation.toUpperCase().contains(
                _searchController.text.toUpperCase(),
              );
        },
      );
    }

    allArticles.forEach(
      (art) {
        widgetList.add(BuildListItem(art));
      },
    );
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
        body: Stack(
          children: [
            StreamBuilder<ListeArticles>(
              stream: _listArticleBloc.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  listArticles.clear();
                  listArticles.addAll(snapshot.data.articles);
                  filterList(
                    allArticles: snapshot.data.articles,
                  );
                  return BuildArticleList(
                      screen: screen,
                      data: snapshot.data,
                      scrollController: _scrollController,
                      widgetList: widgetList);
                }
                return BuildArticleList(
                  screen: screen,
                  scrollController: _scrollController,
                );
              },
            ),
            showSearchbar ? _searchBar(screen) : Container(),
            _buildNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar(screen) {
    return Positioned(
      top: 40,
      left: 30,
      right: 30,
      child: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, child) {
          return AnimatedContainer(
            height: 50,
            child: child,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: screen.width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border.all(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(10),
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
            children: [
              Icon(Icons.search, color: Colors.black87),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  cursorColor: Colors.black,
                  controller: _searchController,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText:
                        '${userIdentity.nom.split(' ').first} Rechercher ici !!!',
                  ),
                ),
              ),
              ClickAnimation(
                onTap: () => Navigator.of(context).pushNamed(
                  Profile,
                  arguments: userIdentity,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Image.network(
                      "${Endpoint.uplaod}${userIdentity.photo}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return BlocListener<UserIdentityBloc, UserIdentityState>(
      bloc: _userIdentityBloc,
      listener: (context, state) {
        if (state is UserIdentitySuccess) {
          setState(() {
            userIdentity = state.userResponse.user;
          });
        }
      },
      child: Positioned(
        bottom: 10,
        left: 0,
        right: 0,
        child: AnimatedBuilder(
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
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              userData: userIdentity,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  _buildNavigationItem(
                    icon: Icons.search,
                    context: context,
                    onTap: () {
                      setState(() {
                        showSearchbar = !showSearchbar;
                      });
                    },
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
                    icon: Icons.refresh,
                    context: context,
                    onTap: () {
                      _listArticleBloc.getArticles();
                      _userIdentityBloc =
                          BlocProvider.of<UserIdentityBloc>(context)
                            ..add(
                              LoadUserIdentity(
                                userId: widget.user.id,
                              ),
                            );

                      Fluttertoast.showToast(
                        msg: "Donnees rafraichies",
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.black.withOpacity(0.6),
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
