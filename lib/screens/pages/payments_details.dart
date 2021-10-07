import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/paiement/get_all_paiement.dart';
import 'package:e_commerce/utils/app_theme.dart';
import 'package:flutter/material.dart';

class PaymentsDetails extends StatefulWidget {
  final Response paiementData;
  // static
  const PaymentsDetails({
    Key key,
    @required this.paiementData,
  }) : super(key: key);

  @override
  _PaymentsDetailsState createState() => _PaymentsDetailsState();
}

class _PaymentsDetailsState extends State<PaymentsDetails> {
  PageController _pageviewController = PageController();
  int curentIndex;

  @override
  void initState() {
    _pageviewController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: screen.height * .55,
              width: screen.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 65,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 100,
                              width: 100,
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
                                  shape: BoxShape.circle),
                              child: CustomCashedImage(
                                imageUrl:
                                    "${Endpoint.uplaod}${widget.paiementData.user.photo}",
                                screen: screen,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            // color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _richtextItem(
                                  'nom',
                                  '${widget.paiementData.user.nom}',
                                  isontop: true,
                                ),
                                _richtextItem('contact',
                                    '${widget.paiementData.user.contact}',
                                    isontop: true),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // BackwardButton(color: AppTheme.blueColor),
                  Positioned(
                    top: 24,
                    child: Container(
                      // color: Colors.amber,
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
                              "DETAILS",
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
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screen.height * .40,
              width: screen.width,
              decoration: BoxDecoration(
                color: AppTheme.blueColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "details achat",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          '${widget.paiementData.createdAt.split(' ').first}',
                          style: TextStyle(
                              color: Colors.white54,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: _buildPageView(
                        screen,
                        detailsPaiements: widget.paiementData.detailsPaiements,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildPageView(
    Size screen, {
    List<DetailsPaiements> detailsPaiements,
  }) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(bottom: 20, top: 10, left: 20),
        width: screen.width,
        alignment: Alignment.bottomLeft,
        child: PageView.builder(
          controller: _pageviewController,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  height: screen.height * .30,
                  width: screen.width * .40,
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
                  child: CustomCashedImage(
                    imageUrl:
                        "${Endpoint.uplaod}${detailsPaiements[index].article.photoArticles[0].photoArticle}",
                    screen: screen,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _richtextItem(
                        'designation',
                        detailsPaiements[index].article.designation,
                      ),
                      _richtextItem(
                        'pu',
                        detailsPaiements[index].article.pu,
                        isPu: true,
                      ),
                      _richtextItem(
                        'pt',
                        detailsPaiements[index].article.pu *
                            detailsPaiements[index].qteAchete,
                        isPu: true,
                      ),
                      SizedBox(
                        width: screen.width / 2,
                        child: Text(
                          'monsieur ${widget.paiementData.user.nom} a acheté ${widget.paiementData.detailsPaiements[index].qteAchete} ${widget.paiementData.detailsPaiements[index].article.designation}',
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                )
              ],
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

  _richtextItem(title, subTitle, {bool isPu = false, bool isontop = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          text: '$title : \n',
          style: TextStyle(
            color: !isontop ? Colors.white : Colors.black,
          ),
          children: [
            TextSpan(
              text: isPu ? '$subTitle\$' : '$subTitle',
              style: TextStyle(
                  color: !isontop ? Colors.white54 : Colors.black54,
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
