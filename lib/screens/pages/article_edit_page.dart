import 'package:e_commerce/exports/all_exports.dart';
import 'dart:io' as Io;

import 'package:image_picker/image_picker.dart';

class EditArticlePage extends StatefulWidget {
  final Article art;
  EditArticlePage({this.art});

  @override
  _EditArticlePageState createState() => _EditArticlePageState();
}

class _EditArticlePageState extends State<EditArticlePage> {
  bool isLoading;

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
              BuildAdminListItem(articleData: widget.art)
            ],
          ),
        ),
      ),
    );
  }
}

class BuildAdminListItem extends StatefulWidget {
  final Article articleData;

  const BuildAdminListItem({Key key, this.articleData}) : super(key: key);

  @override
  _BuildAdminListItemState createState() => _BuildAdminListItemState();
}

class _BuildAdminListItemState extends State<BuildAdminListItem> {
  Io.File _image1;
  Io.File _image2;
  Io.File _image3;
  bool isLoading;

  Future getImage({int index}) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (index != null) {
      setState(() {
        if (index == 1) {
          _image1 = Io.File(pickedFile.path);
        }
        if (index == 2) {
          _image2 = Io.File(pickedFile.path);
        }
        if (index == 3) {
          _image3 = Io.File(pickedFile.path);
        }
      });
    }
  }

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
                buildItem(1, screen, data: widget.articleData, i: 0),
                buildItem(2, screen, data: widget.articleData, i: 1),
                buildItem(3, screen, data: widget.articleData, i: 2),
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

  buildItem(int index, screen, {Article data, int i}) {
    var image;
    if (index != null) {
      if (index == 1) {
        setState(() {
          image = _image1;
        });
      } else if (index == 2) {
        setState(() {
          image = _image2;
        });
      } else if (index == 3) {
        setState(() {
          image = _image3;
        });
      }
    }
    return Expanded(
      child: ClickAnimation(
        onTap: data == null
            ? () {
                getImage(index: index);
              }
            : null,
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
          child: data == null
              ? image == null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Icon(Icons.add_a_photo),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 80,
                        width: 80,
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomCashedImage(
                    imageUrl:
                        "${Endpoint.uplaod}${data.photoArticles[i].photoArticle}",
                    screen: screen,
                    isHomePage: true,
                  ),
                ),
        ),
      ),
    );
  }
}
