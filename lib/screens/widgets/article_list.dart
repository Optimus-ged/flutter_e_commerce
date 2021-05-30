import 'package:e_commerce/exports/all_exports.dart';

class BuildArticleList extends StatelessWidget {
  final ListeArticles data;
  final Size screen;
  final ScrollController scrollController;

  const BuildArticleList(
      {Key key,
      this.data,
      @required this.screen,
      @required this.scrollController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            controller: scrollController,
            /*
              If data variable is null we give 5 as the length of the list
              otherwise we take the real length of the wich comes from the
              snapshot
            */
            itemCount: (data != null) ? data.length : 5,
            itemBuilder: (context, index) {
              /* If data variable is not null, we retreive the list wich 
                data otherwise we retreive the shimmer list to specify
                to the user that data are loading
              */
              return data != null
                  ? ClickAnimation(
                      onTap: () => Navigator.of(context).pushNamed(
                        Details,
                        arguments: data.articles[index],
                      ),
                      child: Column(
                        crossAxisAlignment: (index % 2 == 0)
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
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
                              child: Image.network(
                                "${Endpoint.uplaod}${data.articles[index].photoArticles[0].photoArticle}",
                                height: screen.height * .32,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${data.articles[index].designation}",
                            style: TextStyle(
                                color: AppTheme.designationColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "${data.articles[index].pu}\$",
                            style: TextStyle(
                              color: AppTheme.puColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: AppTheme.radiantBotom,
                      highlightColor: AppTheme.radiantTop,
                      period: Duration(seconds: 3),
                      child: Column(
                        crossAxisAlignment: (index % 2 == 0)
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: screen.height * .32,
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
                            width: screen.width * .35,
                          ),
                          SizedBox(height: 2),
                          Container(
                            color: AppTheme.greyColor,
                            height: 15,
                            width: screen.width * .10,
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
