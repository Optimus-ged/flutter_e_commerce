import 'package:e_commerce/exports/all_exports.dart';

class CustomCashedImage extends StatelessWidget {
  final String imageUrl;
  final Size screen;
  final BoxShape shape;
  final bool isHomePage;
  CustomCashedImage({this.imageUrl, this.shape, this.screen, this.isHomePage});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, progress) => Container(
        child: Icon(Icons.camera),
        height: isHomePage != null ? screen.height * .32 : screen.height * .40,
      ),
      errorWidget: (context, url, error) => Container(
        child: Icon(Icons.error),
        height: isHomePage != null ? screen.height * .32 : screen.height * .40,
      ),
      imageBuilder: (
        context,
        imageProvider,
      ) =>
          Container(
        height: isHomePage != null ? screen.height * .32 : screen.height * .40,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: isHomePage != null ? BoxFit.cover : BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
