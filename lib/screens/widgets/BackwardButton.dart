import 'package:e_commerce/exports/all_exports.dart';

class BackwardButton extends StatelessWidget {
  final Color color;
  const BackwardButton({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 20,
      child: ClickAnimation(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
