import 'package:e_commerce/bloc/article_bloc/favorite_article_bloc.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  get _favoriteArticleBloc => locator.get<FavoriteArticleBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            // StreamBuilder<List<LocalArticle>>(
            // builder: (context, snapshot) {
            // if (snapshot.hasData) {
            Container(
          height: screen.height,
          width: screen.width,
          color: Colors.grey[50],
          child: Column(
            children: [
              SizedBox(height: 24),
              Container(
                child: Container(
                  width: screen.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: ClickAnimation(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "ARTICLES FAVORITS",
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Container(
                    width: screen.width,
                    decoration: BoxDecoration(
                      // color: AppTheme.blueColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: StreamBuilder<List<LocalArticle>>(
                        stream: locator.get<FavoriteArticleBloc>().subject,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  snapshot.data.length > 0
                                      ? Container(
                                          // color: AppTheme.blueColor,
                                          child: GridView.builder(
                                            padding: EdgeInsets.only(
                                              bottom: 20,
                                              top: 20,
                                              left: 10,
                                              right: 10,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 20,
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.60,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () => _removeFromFavorite(
                                                snapshot.data[index],
                                              ),
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    CustomCashedImage(
                                                      imageUrl:
                                                          "${Endpoint.uplaod}${snapshot.data[index].photo}",
                                                      screen: screen,
                                                      isHomePage: true,
                                                    ),
                                                    SizedBox(height: 5),
                                                    SizedBox(
                                                      width: 80,
                                                      child: Text(
                                                        "${snapshot.data[index].designation}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black45,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          // color: Colors.yellow,
                                          width: screen.width,
                                          height: screen.height,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 120),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .remove_shopping_cart_outlined,
                                                  color: Colors.grey[300],
                                                  size: 100,
                                                ),
                                                Text(
                                                  "aucune favorie\ndiponible",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            );
                            // return SingleChildScrollView(
                            // child: Column(
                            //   children: [
                            //     snapshot.data.length > 0
                            //         ?
                            //         Container(
                            //             // color: AppTheme.blueColor,
                            //             child: GridView.builder(
                            //               padding: EdgeInsets.only(
                            //                 bottom: 20,
                            //                 top: 20,
                            //                 left: 10,
                            //                 right: 10,
                            //               ),
                            //               gridDelegate:
                            //                   SliverGridDelegateWithFixedCrossAxisCount(
                            //                 crossAxisSpacing: 10,
                            //                 mainAxisSpacing: 20,
                            //                 crossAxisCount: 2,
                            //                 childAspectRatio: 0.60,
                            //               ),
                            //               primary: false,
                            //               shrinkWrap: true,
                            //               itemCount: snapshot.data.length,
                            //               itemBuilder: (context, index) =>
                            //                   InkWell(
                            //                 onTap: () => _removeFromFavorite(
                            //                   snapshot.data[index],
                            //                 ),
                            //                 child: Container(
                            //                   child: Column(
                            //                     children: [
                            //                       CustomCashedImage(
                            //                         imageUrl:
                            //                             "${Endpoint.uplaod}${snapshot.data[index].photo}",
                            //                         screen: screen,
                            //                         isHomePage: true,
                            //                       ),
                            //                       SizedBox(height: 5),
                            //                       SizedBox(
                            //                         width: 80,
                            //                         child: Text(
                            //                           "${snapshot.data[index].designation}",
                            //                           textAlign:
                            //                               TextAlign.center,
                            //                           style: TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.w600,
                            //                             color: Colors.black45,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           )
                            //         : Expanded(
                            //             child: Column(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.center,
                            //               children: [
                            //                 Icon(
                            //                   Icons
                            //                       .remove_shopping_cart_outlined,
                            //                   color: Colors.grey[50],
                            //                   size: 100,
                            //                 ),
                            //                 Text(
                            //                   "aucune favorie\ndiponible",
                            //                   textAlign: TextAlign.center,
                            //                   style: TextStyle(
                            //                     color: Colors.grey[300],
                            //                     fontSize: 13,
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //   ],
                            // ),
                            // );
                          }
                          return Center();
                        }),
                  ),
                ),
              ),
            ],
          ),
        )
        // }
        // return Center(
        //   child: CircularProgressIndicator(),
        // );
        // },
        // ),
        );
  }

  // Deleting an item from list of favorites
  _removeFromFavorite(LocalArticle data) {
    final result = _favoriteArticleBloc.deleteFavoriteArticle(id: data.id);
    if (result == 200) {
      Fluttertoast.showToast(
        msg: "${data.designation} supprime des favoris avec succes",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black.withOpacity(0.6),
      );
    }
  }

  // Building list view item
  Widget _buildListItem({List<LocalArticle> data, int index}) {
    return Container(
      child: Text('test'),
    );
  }
}
