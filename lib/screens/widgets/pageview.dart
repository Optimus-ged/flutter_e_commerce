import 'package:e_commerce/exports/all_exports.dart';

class PageViewWidget extends StatelessWidget {
  final int curentIndex;
  final Color color;
  final PageController pageViewController;
  final double height;
  final Widget child;
  final void Function(int) onPageChanged;
  PageViewWidget(this.curentIndex, this.pageViewController,
      {this.color, this.height, this.child, this.onPageChanged});
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: Container(
        height: height == null ? screen.height : height,
        width: screen.width,
        color: color == null ? AppTheme.blueColor : Colors.transparent,
        child: _buildPageView(),
      ),
    );
  }

  _buildPageView() {
    return PageView.builder(
      controller: pageViewController,
      itemBuilder: (context, index) => child,
      itemCount: 3,
      onPageChanged: onPageChanged,
    );
  }
}
