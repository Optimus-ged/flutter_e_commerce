import 'package:e_commerce/exports/all_exports.dart';

class PageviewIndicator extends StatelessWidget {
  final int index;
  PageviewIndicator(this.index);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: (index == index) ? 10 : 5,
      width: (index == index) ? 10 : 5,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: (index == index) ? Color(0xfff1c422) : AppTheme.whiteColor),
      foregroundDecoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5)),
    );
  }
}
