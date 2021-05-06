import 'package:e_commerce/exports/all_exports.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: AppTheme.lessPinkColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: screen.height * .45,
              width: screen.width,
              child: Center(
                child: Text(
                  "${args["title"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screen.height * .55,
              width: screen.width,
              decoration: BoxDecoration(
                color: AppTheme.blueColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: screen.height * .52,
            right: 50,
            child: Material(
              elevation: 10,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppTheme.pinkColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
