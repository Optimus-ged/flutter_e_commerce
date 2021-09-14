import 'package:e_commerce/utils/app_theme.dart';
import 'package:flutter/material.dart';

class AdminHomepage extends StatelessWidget {
  // const AdminHomepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}

class BuildAdminListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          Text('Designation'),
          Text('pu'),
          Text('details'),
        ],
      ),
    );
  }
}
