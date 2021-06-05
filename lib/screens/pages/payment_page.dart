import 'package:e_commerce/exports/all_exports.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment page"),
      ),
      body: StreamBuilder<List<LocalArticle>>(
        stream: localArticleBloc.subject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${snapshot.data[index].id}"),
                  title: Text(
                    "${snapshot.data[index].designation}",
                  ),
                  subtitle: Text(
                    "${snapshot.data[index].photo}",
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
