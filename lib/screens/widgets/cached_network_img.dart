import 'package:e_commerce/exports/all_exports.dart';

class CacheNetworkImg extends StatelessWidget {
  final String imageUrl;
  final BoxShape shape;
  CacheNetworkImg({@override this.imageUrl, this.shape});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(
        child: Icon(Icons.face),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(Icons.error),
      ),
      imageBuilder: (
        context,
        imageProvider,
      ) =>
          Container(
        decoration: BoxDecoration(
          shape: shape,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      fadeInCurve: Curves.easeIn,
      fadeInDuration: Duration(
        seconds: 2,
      ),
    );
  }
}
