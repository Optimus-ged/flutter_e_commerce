

import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/model/article_model/article_response.dart';
import 'package:e_commerce/optimus_lib/routes/routes_constants.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/click_animation.dart';

class BuildItemsList extends StatelessWidget {
  final ListeArticles data;
  BuildItemsList({@override this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.only(
          bottom: 70,
          top: 30,
          left: 10,
          right: 10,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ClickAnimation(
            onTap: () => Navigator.of(context).pushNamed(
              Details,
              arguments: {"title": "$index"},
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.2, color: Colors.black12),
              ),
              child: Text("$index"),
            ),
          );
        },
      ),
    );
  }
}
