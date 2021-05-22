import 'package:e_commerce/exports/all_exports.dart';

class PageViewWidget extends StatelessWidget {
  final int curentIndex;
  final PageController pageViewController;
  final void Function(int) onPageChanged;
  PageViewWidget(this.curentIndex, this.pageViewController, {this.onPageChanged});
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: Container(
        height: screen.height,
        width: screen.width,
        color: AppTheme.blueColor,
        padding: EdgeInsets.only(left: 20, right: 20, top: 5),
        child: _buildPageView(),
      ),
    );
  }

  _buildPageView() {
    return PageView.builder(
      controller: pageViewController,
      itemBuilder: (context, index) => Container(
        alignment: Alignment.center,
        child: Text(
          "$index",
          style: TextStyle(
            fontSize: 100,
            color: Colors.amber,
          ),
        ),
      ),
      itemCount: 3,
      onPageChanged: onPageChanged,
      // onPageChanged: (value) {
      //   curentIndex = value;
      //   setState(() {});
      // },
    );
  }
}
