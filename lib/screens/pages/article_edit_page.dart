import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/routes/routes_constants.dart';
import 'dart:io' as Io;

import 'package:image_picker/image_picker.dart';

class EditArticlePage extends StatefulWidget {
  final Article art;
  EditArticlePage({this.art});

  @override
  _EditArticlePageState createState() => _EditArticlePageState();
}

class _EditArticlePageState extends State<EditArticlePage> {
  
  
  Io.File _image;
  bool isLoading;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = Io.File(pickedFile.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screen.height,
        width: screen.width,
        color: Colors.grey[50],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              Container(
                width: screen.width,
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: ClickAnimation(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 50,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.art == null ? "AJOUT ARTICLE" : "EDITER",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    widget.art != null
                        ? Positioned(
                            right: 20,
                            child: ClickAnimation(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 50,
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(height: 30),
              BuildAdminListItem()
            ],
          ),
        ),
      ),
    );
  }
}

class BuildAdminListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          SizedBox(height: 20),
          buildTextField(screen, hint: "designation"),
          SizedBox(height: 20),
          buildTextField(screen, hint: "pu"),
          SizedBox(height: 20),
          buildTextField(screen, hint: "a props"),
          SizedBox(height: 10),
          ClickAnimation(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              decoration: BoxDecoration(
                color: AppTheme.blueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Editer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  buildTextField(screen, {String hint}) {
    return Column(
      children: [
        Container(
          width: screen.width * .80,
          child: TextField(
            textAlign: TextAlign.center,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: 6,
            minLines: 1,
            decoration: InputDecoration.collapsed(
              hintText: '$hint',
            ),
          ),
        ),
        Divider()
      ],
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
