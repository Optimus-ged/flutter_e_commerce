import 'package:e_commerce/exports/all_exports.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        
        bottomNavigationBar: Material(
          elevation: 20,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
          child: Container(
            height: 60,
            decoration: BoxDecoration(),
          ),
        ),
      ),
    );
  }
}
