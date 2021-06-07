import 'package:e_commerce/exports/all_exports.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<List<LocalArticle>>(
        stream: locator.get<LocalArticleBloc>().subject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // leading: Text("${snapshot.data[index].id}"),
                  // leading: CustomCashedImage(
                  //   imageUrl: "${Endpoint.uplaod}${snapshot.data[index].photo}",
                  //   screen: screen,
                  // ),
                  leading: Container(
                    width: 50,
                    // color: Colors.green,
                    child: Image.network(
                      "${Endpoint.uplaod}${snapshot.data[index].photo}",
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
