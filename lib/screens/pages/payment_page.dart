import 'package:e_commerce/exports/all_exports.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<LocalArticle>>(
        stream: locator.get<LocalArticleBloc>().subject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    // width: 50,
                    // height: 100,
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CustomCashedImage(
                        imageUrl:
                            "${Endpoint.uplaod}${snapshot.data[index].photo}",
                        isHomePage: false,
                        // screen: ,
                      ),
                    ),
                  ),
                  title: Text(
                    "${snapshot.data[index].designation}",
                  ),
                  subtitle: Text(
                    "${Endpoint.uplaod}${snapshot.data[index].photo}",
                  ),
                );
              },
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
