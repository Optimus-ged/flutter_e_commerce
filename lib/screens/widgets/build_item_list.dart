import 'package:e_commerce/exports/all_exports.dart';

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
              Routes.details,
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
