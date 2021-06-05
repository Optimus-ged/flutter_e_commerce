import 'dart:html';

import 'package:e_commerce/bloc/article_bloc/local_article_bloc.dart';
import 'package:e_commerce/exports/all_exports.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment page"),),
      body: StreamBuilder<Object>(
        stream: localArticleBloc.subject,
        builder: (context, snapshot) {
          return Container();
        }
      ),
    );
  }
}
