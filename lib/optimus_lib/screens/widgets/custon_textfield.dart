import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/utils/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final double top;
  final bool isFirst, obscureText;
  final String hint;
  final TextEditingController controller;
  CustomTextField({this.top, this.isFirst, this.obscureText, this.hint, this.controller});
  @override
  Widget build(BuildContext context) {
    EdgeInsets edgeInsets1 = EdgeInsets.only(top: top, left: 10, right: 10);
    EdgeInsets edgeInsets2 = EdgeInsets.only(top: 20, left: 10, right: 10);
    return Padding(
      padding: isFirst ? edgeInsets1 : edgeInsets2,
      child: Container(
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          cursorColor: AppTheme.greyColor,
          obscureText: obscureText,
          style: TextStyle(
            fontSize: 17,
            color: AppTheme.greyColor,
          ),
          decoration: InputDecoration(
            hintText: "$hint",
            enabledBorder: _outlineBorder(color: AppTheme.lessWhiteColor),
            focusedBorder: _outlineBorder(color: AppTheme.pinkColor),
            hintStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }

  // Building custom outline borders
  OutlineInputBorder _outlineBorder({Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      gapPadding: 0,
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}
