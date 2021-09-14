import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/utils/app_theme.dart';
import 'package:flutter/material.dart';

class AdminHomepage extends StatelessWidget {
  // const AdminHomepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppTheme.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      bottom: 70,
                      top: 30,
                      left: 10,
                      right: 10,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => BuildAdminListItem(),
                  ),
                )
              ],
            )
            // showSearchbar ? _searchBar(screen) : Container(),
            // _buildNavigation(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.blueColor,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

class BuildAdminListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                buildItem(),
                buildItem(),
                buildItem(),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Designation : ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),
                ),
                SizedBox(width: 10),
                Text('designation')
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Pu : ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),
                ),
                SizedBox(width: 10),
                Text('pu')
              ],
            ),
          ),
          Text(
              'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magni, ea? Consequatur, doloribus? Aut corrupti suscipit dolorem! Maxime atque deleniti rem commodi, incidunt assumenda, doloremque veniam laudantium nostrum tempora ullam consectetur.'),
        ],
      ),
    );
  }

  buildItem() {
    return Expanded(
      child: Container(
        height: 150,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 2),
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
    );
  }
}
