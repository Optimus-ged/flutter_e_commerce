import 'package:e_commerce/exports/all_exports.dart';

class PageviewIndicator extends StatelessWidget {
  final int curentIndex;
  PageviewIndicator(this.curentIndex);
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: Container(
        height: 30,
        width: screen.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: (curentIndex == index) ? 10 : 5,
              width: (curentIndex == index) ? 10 : 5,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: (curentIndex == index)
                    ? AppTheme.pinkColor
                    : Colors.grey[200],
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
