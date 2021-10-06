import 'package:e_commerce/bloc/create_paiment_bloc/create_paiement_bloc.dart';
import 'package:e_commerce/bloc/create_paiment_bloc/create_paiement_event.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/paiement/create_paiement.dart';
import 'package:e_commerce/screens/widgets/dimissable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatefulWidget {
  final User userData;
  PaymentPage({this.userData});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  CreatePaiementBloc _createPaiementBloc;
  double totalPayment;
  get _localArticleBloc => locator.get<LocalArticleBloc>();

  @override
  void initState() {
    totalPayment = 0;
    _createPaiementBloc = BlocProvider.of<CreatePaiementBloc>(context);
    super.initState();
  }

  void browseList({List<LocalArticle> data}) {
    data.forEach((v) {
      totalPayment = totalPayment + (v.qte * v.pu);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<LocalArticle>>(
        stream: _localArticleBloc.subject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            browseList(data: snapshot.data);
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
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20,
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
                              "PANNIER",
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
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            snapshot.data.length != 0
                                ? Expanded(
                                    child: ListView.builder(
                                      itemCount: snapshot.data.length,
                                      padding: EdgeInsets.only(top: 5),
                                      // This make the list scrollinng only
                                      // when data are so many
                                      primary: false,
                                      itemBuilder: (context, index) {
                                        return DimissableWidget(
                                          item: snapshot.data[index],
                                          child: _buildListItem(
                                            data: snapshot.data,
                                            index: index,
                                          ),
                                          onDismiss: (direction) =>
                                              _removeFromDataList(
                                            context,
                                            index,
                                            direction,
                                            snapshot.data[index],
                                          ),
                                        );
                                      },
                                    ),
                                  )
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
                                          "vide",
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            Text(
                              "A payer : $totalPayment\$",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 17,
                                height: 1.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            CustomButton(
                              title: "Effectuer paiement",
                              icon: Icon(
                                Icons.payments,
                                color: AppTheme.whiteColor,
                              ),
                              onTap: () {
                                return showDialog(
                                  context: context,
                                  builder: (context) =>
                                      _paymentDialog(snapshot.data),
                                );
                              },
                            ),
                            SizedBox(height: 20)
                          ],
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
      child: ListTile(
        minVerticalPadding: 0,
        horizontalTitleGap: 5,
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        leading: Container(
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
            borderRadius: BorderRadius.circular(6),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CustomCashedImage(
              imageUrl: "${Endpoint.uplaod}${data[index].photo}",
              isPayPage: true,
            ),
          ),
        ),
        title: Container(
          alignment: Alignment.topLeft,
          height: 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${data[index].designation}",
              ),
              Text(
                "Pu : ${data[index].pu}\$\nPt : ${data[index].pu * data[index].qte}\$",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        trailing: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          height: 55,
          width: 100,
          child: Row(
            children: [
              _buildOptionItem(
                title: "+",
                ontap: () => _addOrDropData(
                  data: data[index],
                  index: index,
                ),
              ),
              _buildOptionItem(
                title: "${data[index].qte}",
                flex: 1,
                margin: 5,
                color: Colors.transparent,
                fontSize: 12,
                isQte: true,
              ),
              _buildOptionItem(
                title: "-",
                ontap: () => _addOrDropData(
                  data: data[index],
                  index: index,
                  isAdding: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Building the item of making options
  Widget _buildOptionItem(
      {int flex = 2,
      double margin = 0,
      String title,
      double fontSize = 20,
      Color color = Colors.white,
      bool isQte = false,
      VoidCallback ontap}) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          alignment: Alignment.center,
          decoration: !isQte
              ? BoxDecoration(
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[100],
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(5),
                )
              : BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
          child: Center(
            child: Text(
              "$title",
              style: TextStyle(
                color: Colors.amber,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Option to add quantity or to make the oposite
  void _addOrDropData({LocalArticle data, int index, bool isAdding = true}) {
    final _article = LocalArticle(
      id: data.id,
      photo: data.photo,
      designation: data.designation,
      pu: data.pu,
      qte: (data.qte >= 1)
          ? isAdding
              ? data.qte + 1
              : (data.qte > 1)
                  ? data.qte - 1
                  : data.qte
          : data.qte,
    );

    locator.get<LocalArticleBloc>().updateLocalArticle(data: _article);

    setState(() {
      totalPayment = 0.0;
    });
  }

  // Building Payment showdialog
  Widget _paymentDialog(List<LocalArticle> data) {
    return Padding(
      padding: EdgeInsets.only(
        top: 100,
        bottom: 200,
        left: 20,
        right: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Voulez vous vraiment effectuer ce\npaiement ?',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          'Total a Payer : $totalPayment\$',
                        ),
                      ),
                      Spacer(),
                      CustomButton(
                        title: "Confirmer",
                        onTap: () {
                          _onPaiementButtonPressed(dataArticle: data);
                          // Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Building payment with success widget
  Widget _paymentSuccess() {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(
          top: 100,
          bottom: 200,
          left: 20,
          right: 20,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadiusDirectional.circular(5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Voulez vous vraiment effectuer ce\npaiement ?',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Icon(
                            Icons.verified,
                            size: 60,
                            color: AppTheme.pinkColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Paimement effectue\navec succes",
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Deleting an item from list of local data
  _removeFromDataList(
    BuildContext context,
    index,
    direction,
    LocalArticle data,
  ) {
    final result = locator.get<LocalArticleBloc>().deleteLocalArticle(
          id: data.id,
        );

    setState(() {
      totalPayment = 0.0;
    });
    if (result == 200) {
      // Fluttertoast.showToast(
      //   msg: "${data.designation} supprime de la liste avec succes",
      //   backgroundColor: Colors.black.withOpacity(0.6),
      // );
    }
  }

  _onPaiementButtonPressed({
    List<LocalArticle> dataArticle,
  }) {
    List<DataList> dataList = [];

    for (var i in dataArticle) {
      dataList.add(
        DataList(idArticle: i.id, qteAchete: i.qte),
      );
    }

    CreatePaiement data = CreatePaiement(
      idUser: widget.userData.id,
      montant: totalPayment,
      dataList: dataList,
    );

    _createPaiementBloc.add(CreatePaiementButtonPressed(paiementData: data));
  }
}
