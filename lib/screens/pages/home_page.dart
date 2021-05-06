import 'package:e_commerce/exports/all_exports.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.whiteColor,
      systemNavigationBarColor: AppTheme.whiteColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BuildItemsList(),
            ),
          ],
        ),
        floatingActionButton: Material(
          elevation: 20,
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
          child: Container(
            height: 60,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavigationItem(
                  icon: Icons.shopping_basket_outlined,
                  context: context,
                ),
                _buildNavigationItem(
                  icon: Icons.search,
                  context: context,
                  onTap: () => Navigator.of(context).pushNamed(
                    Routes.search,
                    arguments: {"hint": "Sa marche"},
                  ),
                ),
                _buildNavigationItem(
                  icon: Icons.exit_to_app,
                  context: context,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  // Building botom navigation ba item
  _buildNavigationItem(
      {IconData icon, VoidCallback onTap, @required BuildContext context}) {
    return ClickAnimation(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Icon(icon, color: AppTheme.lessWhiteColor),
        ),
      ),
    );
  }
}
