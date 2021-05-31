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
      // placeholder: (context, url) => Center(
      //   child: Container(
      //     child: Icon(Icons.face),
      //     height: screen.height * .32,
      //   ),
      // ),
      progressIndicatorBuilder: (context, url, progress) => Container(
        child: Icon(Icons.camera),
        height: screen.height * .32,
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(Icons.error),
      ),
      imageBuilder: (
        context,
        imageProvider,
      ) =>
          Container(
        height: isHomePage != null ? screen.height * .32 : screen.height * .40,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          // color: Colors.amber,
          image: DecorationImage(
            image: imageProvider,
            fit: isHomePage != null ? BoxFit.cover : BoxFit.fitHeight,
          ),
        ),
      ),
      //     CircleAvatar(
      //   radius: 50,
      //   backgroundColor: Colors.transparent,
      //   backgroundImage: imageProvider,
      // ),
    );
  }
}
