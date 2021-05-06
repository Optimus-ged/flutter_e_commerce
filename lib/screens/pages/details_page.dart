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
              // color: Colors.grey,
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
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
