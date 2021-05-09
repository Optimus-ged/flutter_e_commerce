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
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildChoice(color: AppTheme.lessPinkColor),
                        _buildChoice(color: AppTheme.yellowColor),
                        _buildChoice(color: AppTheme.pinkColor)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screen.height * .52,
            right: 50,
            child: Material(
              elevation: 10,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                width: 45,
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

  // Building circle container
  _buildChoice({Color color}) {
    return CircleAvatar(
      backgroundColor: AppTheme.lessPinkColor,
      radius: 20,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 15,
      ),
    );
  }
}
