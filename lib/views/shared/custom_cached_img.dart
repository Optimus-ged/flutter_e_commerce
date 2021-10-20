import 'package:e_commerce/views/shared/shared_index.dart';

class CustomCashedImage extends StatelessWidget {
  final String imageUrl;
  final Size screen;
  final BoxShape shape;
  final bool isHomePage;
  final bool isPayPage;
  CustomCashedImage(
      {this.imageUrl,
      this.shape,
      this.screen,
      this.isHomePage = false,
      this.isPayPage = false});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, progress) => Container(
        child: Icon(Icons.camera),
        height: isHomePage
            ? screen.height * .32
            : isPayPage
                ? 100
                : screen.height * .40,
      ),
      errorWidget: (context, url, error) => Container(
        child: Icon(Icons.error),
        height: isHomePage
            ? screen.height * .32
            : isPayPage
                ? 100
                : screen.height * .40,
      ),
      imageBuilder: (
        context,
        imageProvider,
      ) =>
          Container(
        height: isHomePage
            ? screen.height * .32
            : isPayPage
                ? 100
                : screen.height * .40,
        width: isPayPage ? 50 : null,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: isHomePage ? BoxFit.cover : BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
