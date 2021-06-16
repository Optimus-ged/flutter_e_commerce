import 'package:e_commerce/exports/all_exports.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Icon icon;
  const CustomButton({
    Key key,
    this.onTap,
    this.title = "Ajouter au pannier",
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClickAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.pinkColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(width: 5),
            Text(
              "$title",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
