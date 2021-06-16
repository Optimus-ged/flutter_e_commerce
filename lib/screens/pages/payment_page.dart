import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/screens/widgets/custom_btn.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double totalPayment;

  @override
  void initState() {
    totalPayment = 0;
    super.initState();
  }

  void browseList({List<LocalArticle> data}) {
    data.forEach((v) {
      totalPayment = totalPayment + (v.qte * v.pu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<LocalArticle>>(
        stream: locator.get<LocalArticleBloc>().subject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            browseList(data: snapshot.data);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    // This make the list scrollinng only
                    // when data are so many
                    primary: false,
                    itemBuilder: (context, index) {
                      return ListTile(
                        minVerticalPadding: 0,
                        horizontalTitleGap: 5,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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
                              imageUrl:
                                  "${Endpoint.uplaod}${snapshot.data[index].photo}",
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
                                "${snapshot.data[index].designation}",
                              ),
                              Text(
                                "Pu : ${snapshot.data[index].pu}\$\nPt : ${snapshot.data[index].pu * snapshot.data[index].qte}\$",
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
                                  data: snapshot.data[index],
                                  index: index,
                                ),
                              ),
                              _buildOptionItem(
                                title: "${snapshot.data[index].qte}",
                                flex: 1,
                                margin: 5,
                                color: Colors.transparent,
                                fontSize: 12,
                                isQte: true,
                              ),
                              _buildOptionItem(
                                title: "-",
                                ontap: () => _addOrDropData(
                                  data: snapshot.data[index],
                                  index: index,
                                  isAdding: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: AppTheme.pinkColor,
                  padding: EdgeInsets.all(10),
                  child: Text("$totalPayment"),
                ),
                SizedBox(height: 10),
                CustomButton(
                  title: "Effectuer payement",
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
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
          decoration: isQte
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
}
