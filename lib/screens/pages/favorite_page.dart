import 'package:e_commerce/bloc/article_bloc/favorite_article_bloc.dart';
import 'package:e_commerce/exports/all_exports.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<LocalArticle>>(
        stream: locator.get<FavoriteArticleBloc>().subject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: screen.height,
              width: screen.width,
              color: Colors.grey[50],
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Container(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "ARTICLES FAVORITS",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              snapshot.data.length != 0
                                  ? Container(
                                      color: Colors.amber,
                                      child: GridView.builder(
                                        padding: EdgeInsets.only(
                                          bottom: 70,
                                          top: 30,
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
                                            Container(
                                          color: Colors.red,
                                          child: Column(
                                            children: [
                                              CustomCashedImage(
                                                imageUrl:
                                                    "${Endpoint.uplaod}${snapshot.data[index].photo}",
                                                screen: screen,
                                              ),
                                              Text(
                                                "${snapshot.data[index].designation}",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  //  Expanded(
                                  //     child: ListView.builder(
                                  //       itemCount: snapshot.data.length,
                                  //       padding: EdgeInsets.only(top: 5),
                                  //       // This make the list scrollinng only
                                  //       // when data are so many
                                  //       primary: false,
                                  //       itemBuilder: (context, index) {
                                  //         return _buildListItem(
                                  //           data: snapshot.data,
                                  //           index: index,
                                  //         );
                                  //       },
                                  //     ),
                                  //   )
                                  : Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.remove_shopping_cart_outlined,
                                            color: Colors.grey[50],
                                            size: 100,
                                          ),
                                          Text(
                                            "aucune favorie\ndiponible",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              // SizedBox(height: 10),
                              // CustomButton(
                              //   title: "Supprimer les favorits",
                              //   icon: Icon(
                              //     Icons.delete,
                              //     color: AppTheme.whiteColor,
                              //   ),
                              //   onTap: () {},
                              // ),
                              // SizedBox(height: 20)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // Building list view item
  Widget _buildListItem({List<LocalArticle> data, int index}) {
    return Container(
      child: Text('test'),
    );
  }

  // Building the item of making options
  // Widget _buildOptionItem(
  //     {int flex = 2,
  //     double margin = 0,
  //     String title,
  //     double fontSize = 20,
  //     Color color = Colors.white,
  //     bool isQte = false,
  //     VoidCallback ontap}) {
  //   return Expanded(
  //     flex: flex,
  //     child: InkWell(
  //       onTap: ontap,
  //       child: Container(
  //         margin: EdgeInsets.symmetric(horizontal: margin),
  //         alignment: Alignment.center,
  //         decoration: !isQte
  //             ? BoxDecoration(
  //                 color: color,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.grey[100],
  //                     blurRadius: 2,
  //                     offset: Offset(0, 1),
  //                   )
  //                 ],
  //                 borderRadius: BorderRadius.circular(5),
  //               )
  //             : BoxDecoration(
  //                 color: color,
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //         child: Center(
  //           child: Text(
  //             "$title",
  //             style: TextStyle(
  //               color: Colors.amber,
  //               fontSize: fontSize,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Building Payment showdialog
  // Widget _paymentDialog() {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //       top: 100,
  //       bottom: 200,
  //       left: 20,
  //       right: 20,
  //     ),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(5),
  //       child: Container(
  //         height: 200,
  //         width: 200,
  //         decoration: BoxDecoration(
  //           color: Colors.grey[50],
  //           borderRadius: BorderRadiusDirectional.circular(5),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 10),
  //               child: Text(
  //                 'Voulez vous vraiment effectuer ce\npaiement ?',
  //                 style: TextStyle(
  //                   color: Colors.grey[500],
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.vertical(
  //                     top: Radius.circular(
  //                       20,
  //                     ),
  //                   ),
  //                 ),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.max,
  //                   children: [
  //                     Spacer(),
  //                     Container(
  //                       alignment: Alignment.center,
  //                       width: double.infinity,
  //                       child: Text(
  //                         'Total a Payer : $totalPayment\$',
  //                       ),
  //                     ),
  //                     Spacer(),
  //                     CustomButton(
  //                       title: "Confirmer",
  //                       onTap: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                     ),
  //                     SizedBox(height: 20)
  //                   ],
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Building payment with success widget
  // Widget _paymentSuccess() {
  //   return Material(
  //     child: Padding(
  //       padding: EdgeInsets.only(
  //         top: 100,
  //         bottom: 200,
  //         left: 20,
  //         right: 20,
  //       ),
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(5),
  //         child: Container(
  //           height: 200,
  //           width: 200,
  //           decoration: BoxDecoration(
  //             color: Colors.grey[50],
  //             borderRadius: BorderRadiusDirectional.circular(5),
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.max,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 10),
  //                 child: Text(
  //                   'Voulez vous vraiment effectuer ce\npaiement ?',
  //                   style: TextStyle(
  //                     color: Colors.grey[500],
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.vertical(
  //                       top: Radius.circular(
  //                         20,
  //                       ),
  //                     ),
  //                   ),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.max,
  //                     children: [
  //                       Spacer(),
  //                       Container(
  //                         alignment: Alignment.center,
  //                         width: double.infinity,
  //                         child: Icon(
  //                           Icons.verified,
  //                           size: 60,
  //                           color: AppTheme.pinkColor,
  //                         ),
  //                       ),
  //                       SizedBox(height: 10),
  //                       Text(
  //                         "Paimement effectue\navec succes",
  //                         textAlign: TextAlign.center,
  //                       ),
  //                       Spacer(),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
