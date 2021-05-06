import 'package:e_commerce/exports/all_exports.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: screen.height * .40,
                color: Colors.grey,
                child: Text("${args["title"]}"),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: screen.height * .60,
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
      ),
    );
  }
}
