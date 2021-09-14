import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/utils/app_theme.dart';
import 'package:flutter/material.dart';

class AdminHomepage extends StatefulWidget {
  // const AdminHomepage({ Key? key }) : super(key: key);
  @override
  _AdminHomepageState createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  bool showSearchbar;
  var _searchController = TextEditingController();

  @override
  void initState() {
    showSearchbar = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

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
        drawer: Drawer(
          child: Container(
            color: Colors.amber,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
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
            ),
            _searchBar(screen)
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

  Widget _searchBar(screen) {
    return Positioned(
      top: 40,
      left: 30,
      right: 30,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: screen.width,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            // Top Shadow
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              blurRadius: 5,
              offset: Offset(0, -5),
            ),

            // Botom shadoow
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.black87),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                cursorColor: Colors.black,
                controller: _searchController,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: 'Rechercher ici !!!',
                ),
              ),
            ),
            ClickAnimation(
              onTap: () {
                _modalBotomsheet();
              },
              child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.menu),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _modalBotomsheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.0, 1.1],
              colors: [
                Color(0xffB90913),
                Color(0xff800323),
              ],
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClickAnimation(
                onTap: () {},
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("op"),
                      ),
                      Text(
                        'Heure  Normale',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
              ),
              ClickAnimation(
                onTap: () {},
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: Text("data"),
                        ),
                      ),
                      Text(
                        'Heure de Pause',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
                  padding: const EdgeInsets.symmetric(vertical: 2),
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
          SizedBox(height: 5),
          ClickAnimation(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppTheme.blueColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Text(
                'Editer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
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
