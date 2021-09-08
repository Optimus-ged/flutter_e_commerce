import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/routes/routes_constants.dart';

class BuildArticleList extends StatefulWidget {
  final ListeArticles data;
  final List<Widget> widgetList;
  final Size screen;
  final ScrollController scrollController;

  const BuildArticleList(
      {Key key,
      this.data,
      @required this.screen,
      @required this.widgetList,
      @required this.scrollController})
      : super(key: key);

  @override
  _BuildArticleListState createState() => _BuildArticleListState();
}

class _BuildArticleListState extends State<BuildArticleList> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: GridView.builder(
            padding: EdgeInsets.only(
              bottom: 70,
              top: 30,
              left: 10,
              right: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 0.60,
            ),
            primary: false,
            shrinkWrap: true,
            /*
              If data variable is null we give 5 as the length of the list
              otherwise we take the real length of the list wich comes from the
              snapshot
            */
            itemCount: (widget.data != null) ? widget.widgetList.length : 5,
            itemBuilder: (context, index) {
              /* If data variable is not null, we retreive the list from 
                the snapshot, otherwise we retreive the shimmer list to specify
                to the user that data are in loading process
              */
              return widget.data != null
                  // ? _buildListData(index, context, widget.widgetList)
                  ? widget.widgetList[index]

                  // when the application realise that snapshot data is null
                  // it displays this shimmer loading animation
                  : _buildLaodingData(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListData(
      int index, BuildContext context, List<Widget> widgetList) {
    return ClickAnimation(
      onTap: () {
        Navigator.of(context).pushNamed(
          Details,
          arguments: widget.data.articles[index],
        );
      },
      child: BuildListItem(widget.data.articles[index]),
      // child: widgetList,
      // child: Column(
      //   crossAxisAlignment: (index % 2 == 0)
      //       ? CrossAxisAlignment.start
      //       : CrossAxisAlignment.end,
      //   children: [
      //     Container(
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.topCenter,
      //           end: Alignment.bottomCenter,
      //           colors: [
      //             AppTheme.radiantTopRight,
      //             AppTheme.radiantTop,
      //             AppTheme.radiantBotom
      //           ],
      //         ),
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //       child: ClipRRect(
      //         borderRadius: BorderRadius.circular(10),
      //         child: CustomCashedImage(
      //           imageUrl:
      //               "${Endpoint.uplaod}${widget.data.articles[index].photoArticles[0].photoArticle}",
      //           screen: widget.screen,
      //           isHomePage: true,
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 4),
      //     Text(
      //       "${widget.data.articles[index].designation}",
      //       style: TextStyle(
      //           color: AppTheme.designationColor,
      //           fontSize: 13,
      //           fontWeight: FontWeight.w500),
      //     ),
      //     SizedBox(height: 2),
      //     Text(
      //       "${widget.data.articles[index].pu}\$",
      //       style: TextStyle(
      //         color: AppTheme.puColor,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget _buildLaodingData(int index) {
    return Shimmer.fromColors(
      baseColor: AppTheme.radiantBotom,
      highlightColor: AppTheme.radiantTop,
      period: Duration(seconds: 3),
      child: Column(
        crossAxisAlignment: (index % 2 == 0)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Container(
            height: widget.screen.height * .32,
            width: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.radiantTopRight,
                  AppTheme.radiantTop,
                  AppTheme.radiantBotom
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 4),
          Container(
            color: AppTheme.greyColor,
            height: 12,
            width: widget.screen.width * .35,
          ),
          SizedBox(height: 2),
          Container(
            color: AppTheme.greyColor,
            height: 15,
            width: widget.screen.width * .10,
          ),
        ],
      ),
    );
  }
}

class BuildListItem extends StatelessWidget {
  // const BuildListItem({ Key? key }) : super(key: key);
  final Article data;
  // final List<Widget> widgetList;
  BuildListItem(this.data);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return ClickAnimation(
      onTap: () {
        Navigator.of(context).pushNamed(
          Details,
          arguments: data,
        );
      },
      child: Column(
        // crossAxisAlignment:
        //     (index % 2 == 0) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.radiantTopRight,
                  AppTheme.radiantTop,
                  AppTheme.radiantBotom
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomCashedImage(
                imageUrl:
                    "${Endpoint.uplaod}${data.photoArticles[0].photoArticle}",
                screen: screen,
                isHomePage: true,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            "${data.designation}",
            style: TextStyle(
                color: AppTheme.designationColor,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 2),
          Text(
            "${data.pu}\$",
            style: TextStyle(
              color: AppTheme.puColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
