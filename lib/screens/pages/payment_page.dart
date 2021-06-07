import 'package:e_commerce/exports/all_exports.dart';

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
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data[index].designation}",
                            ),
                            Text(
                              "Pu : ${snapshot.data[index].pu}\$",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: AppTheme.pinkColor,
                  padding: EdgeInsets.all(10),
                  child: Text("$totalPayment"),
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
}
