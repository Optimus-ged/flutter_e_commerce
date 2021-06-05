import 'package:e_commerce/bloc/article_bloc/local_article_bloc.dart';
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
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addToChart();
        },
      ),
    );
  }

  _addToChart() {
    final _article = LocalArticle(
      id: 2,
      photo: "test photo 66",
      designation: "designation 18",
      pu: 11.3,
      qte: 1,
    );
    localArticleBloc.addLocalArticle(_article);
  }
}
