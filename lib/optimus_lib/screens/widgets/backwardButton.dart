import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/screens/widgets/click_animation.dart';

class BackwardButton extends StatelessWidget {
  final Color color;
  const BackwardButton({Key key, this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 10,
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
