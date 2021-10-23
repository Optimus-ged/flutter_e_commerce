import 'package:e_commerce/model/enterprise/enterprise.dart';
import 'package:e_commerce/views/shared/custom_cached_img.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

class EnterpriseDetail extends StatelessWidget {
  final Enterprise enterprise;
  const EnterpriseDetail({Key key, this.enterprise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screen.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Retour',
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomCashedImage(
                        imageUrl: "$upload/${enterprise.photo}",
                        screen: MediaQuery.of(context).size,
                        isHomePage: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text("${enterprise.description} "),
                  ),
                  SizedBox(height: 20),
                  // Container(
                  //   padding: EdgeInsets.only(left: 40),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text('Tranche'),
                  //       SizedBox(height: 10),
                  //       Container(
                  //         child: Row(
                  //           children: [
                  //             Material(
                  //               elevation: 4,
                  //               borderRadius: BorderRadius.circular(25),
                  //               child: Container(
                  //                 height: 50,
                  //                 width: 50,
                  //                 alignment: Alignment.center,
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: CustomTheme.greyColor,
                  //                   // boxShadow: [
                  //                   //   BoxShadow(
                  //                   //     blurRadius: 2,
                  //                   //     color: Colors.black45,
                  //                   //     offset: Offset(-2, 2),
                  //                   //   ),
                  //                   //   BoxShadow(
                  //                   //     blurRadius: 2,
                  //                   //     color: Colors.grey[200],
                  //                   //     offset: Offset(2, -2),
                  //                   //   )
                  //                   // ]
                  //                 ),
                  //                 child: Text(
                  //                   '1ere',
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       color: Colors.grey,
                  //                       fontWeight: FontWeight.w600),
                  //                 ),
                  //               ),
                  //             ),
                  //             SizedBox(width: 20),
                  //             Material(
                  //               elevation: 4,
                  //               borderRadius: BorderRadius.circular(25),
                  //               child: Container(
                  //                 alignment: Alignment.center,
                  //                 height: 50,
                  //                 width: 50,
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: CustomTheme.greyColor,
                  //                   // boxShadow: [
                  //                   //   BoxShadow(
                  //                   //     blurRadius: 2,
                  //                   //     color: Colors.grey[200],
                  //                   //     offset: Offset(-2, 2),
                  //                   //   ),
                  //                   //   BoxShadow(
                  //                   //     blurRadius: 2,
                  //                   //     color: Colors.grey[200],
                  //                   //     offset: Offset(2, -2),
                  //                   //   )
                  //                   // ]
                  //                 ),
                  //                 child: Text(
                  //                   '2eme',
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       color: Colors.grey,
                  //                       fontWeight: FontWeight.w600),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                  // Container(
                  //   // color: Colors.green,
                  //   margin: EdgeInsets.only(left: 40, top: 10),
                  //   child: Text(
                  //     'Situation de paye',
                  //     style: TextStyle(

                  //         color: Colors.black38,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 14),
                  //   ),
                  // ),
                  //  Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  //   child: Text(
                  //     "Non corporis consequuntur, neque sapiente id maxime, beatae, incidunt dignissimos repudiandae similique fugit ullam nam vitae delectus nostrum quidem lit. Numquam, dignissimos ad.",
                  //   ),
                  // ),
                  // Container(
                  //    margin: EdgeInsets.symmetric(horizontal: 40),
                  //   height: 8,
                  //   decoration: BoxDecoration(
                  //     color: CustomTheme.orangeColor,
                  //     // borderRadius: BorderRadius.circular(10)
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   margin: EdgeInsets.symmetric(horizontal: 40),
                  //   // height: 10,
                  //   child: Text('bonne', style: TextStyle(fontSize: 12),),
                  // )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 40,
              right: 40,
              child: Material(
                elevation: 4,
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 50,
                  width: screen.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: CustomTheme.redColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Payer impot',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
