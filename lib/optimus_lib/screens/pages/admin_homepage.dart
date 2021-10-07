import 'package:e_commerce/optimus_lib/bloc/article_bloc/article_bloc.dart';
import 'package:e_commerce/optimus_lib/data/repository/end_points/end_points.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article_response.dart';
import 'package:e_commerce/optimus_lib/routes/routes_constants.dart';
import 'package:e_commerce/optimus_lib/screens/pages/paiement_page.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/click_animation.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/custom_cached_img.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/dimissable.dart';
import 'package:e_commerce/optimus_lib/utils/app_theme.dart';
import 'package:e_commerce/optimus_lib/utils/setup_locator.dart';
import 'package:flutter/material.dart';

class AdminHomepage extends StatefulWidget {
  @override
  _AdminHomepageState createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  bool showSearchbar;
  var _searchController = TextEditingController();
  ListeArticleBloc get _listArticleBloc => locator.get<ListeArticleBloc>();
  List<Widget> widgetList = [];
  List<Article> listArticles = [];

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
        widgetList.add(BuildAdminListItem(art));
      },
    );
  }

  @override
  void initState() {
    showSearchbar = false;
    widgetList = [];
    _listArticleBloc.getArticles();
    super.initState();
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
        drawer: Drawer(
          child: Container(
            color: Colors.amber,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            StreamBuilder<ListeArticles>(
              stream: _listArticleBloc.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // context.read<UserTest>().username = 'Successsss';
                  listArticles.clear();
                  listArticles.addAll(snapshot.data.articles);
                  filterList(
                    allArticles: snapshot.data.articles,
                  );
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 10,
                            right: 10,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: widgetList.length,
                          itemBuilder: (context, index) {
                            return DimissableWidget(
                              item: BuildAdminListItem(
                                snapshot.data.articles[index],
                              ),
                              child: widgetList[index],
                              onDismiss: (direction) {},
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            _searchBar(screen)
            // _buildNavigation(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.blueColor,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(EditArticle);
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => EditArticlePage(
            //       listArticles: listArticles,
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }

  Widget _searchBar(screen) {
    return Positioned(
      top: 40,
      left: 30,
      right: 30,
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
                autofocus: false,
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
                  hintText: 'Rechercher ici !!!',
                ),
              ),
            ),
            ClickAnimation(
              onTap: () {
                _modalBotomsheet();
              },
              child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.menu),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _modalBotomsheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
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
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClickAnimation(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AllPaiementsPage(),
                    ),
                  );
                  //
                },
                child: Container(
                  child: Text('Paiements'),
                ),
              ),
              ClickAnimation(
                onTap: () {},
                child: Container(
                  child: Text('Menu'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class BuildAdminListItem extends StatelessWidget {
  final Article art;
  BuildAdminListItem(this.art);
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                buildItem(screen, art, 0),
                buildItem(screen, art, 1),
                buildItem(screen, art, 2),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    'Designation : ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),
                ),
                SizedBox(width: 10),
                Text('${art.designation}')
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Pu : ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),
                ),
                SizedBox(width: 10),
                Text('${art.pu}\$')
              ],
            ),
          ),
          Text('${art.aPropos}'),
          SizedBox(height: 5),
          ClickAnimation(
            onTap: () {
              Navigator.of(context).pushNamed(EditArticle, arguments: art);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppTheme.blueColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Text(
                'Editer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildItem(screen, data, int index) {
    return Expanded(
      child: Container(
        height: 150,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 2),
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
          child: CustomCashedImage(
            imageUrl:
                "${Endpoint.uplaod}${data.photoArticles[index].photoArticle}",
            screen: screen,
            isHomePage: true,
          ),
        ),
      ),
    );
  }
}
