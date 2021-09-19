import 'package:e_commerce/bloc/add_article_bloc/add_article_bloc.dart';
import 'package:e_commerce/bloc/add_article_bloc/add_article_event.dart';
import 'package:e_commerce/bloc/add_article_bloc/add_article_state.dart';
import 'package:e_commerce/bloc/update_article_bloc/update_article_bloc.dart';
import 'package:e_commerce/bloc/update_article_bloc/update_article_event.dart';
import 'package:e_commerce/bloc/update_article_bloc/update_article_state.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io' as Io;

import 'package:image_picker/image_picker.dart';

class EditArticlePage extends StatefulWidget {
  final Article art;
  EditArticlePage({this.art});

  @override
  _EditArticlePageState createState() => _EditArticlePageState();
}

class _EditArticlePageState extends State<EditArticlePage> {
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
  bool isLoading;
  AddArticleBloc _addArticleBloc;
  UpdateArticleBloc _updateArticleBloc;
  var _designationController = TextEditingController();
  var _puController = TextEditingController();
  var _aProposController = TextEditingController();
  ListeArticleBloc get _listArticleBloc => locator.get<ListeArticleBloc>();

  Io.File _image1;
  Io.File _image2;
  Io.File _image3;

  @override
  void initState() {
    isLoading = false;
    _addArticleBloc = BlocProvider.of<AddArticleBloc>(context);
    _updateArticleBloc = BlocProvider.of<UpdateArticleBloc>(context);

    if (widget.articleData != null) {
      _designationController =
          TextEditingController(text: widget.articleData.designation);
      _puController =
          TextEditingController(text: widget.articleData.pu.toString());
      _aProposController =
          TextEditingController(text: widget.articleData.aPropos);
    }

    super.initState();
  }

  @override
  void deactivate() {
    _listArticleBloc.stream;
    super.deactivate();
  }

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
    return BlocListener<AddArticleBloc, AddArticleState>(
      bloc: _addArticleBloc,
      listener: (context, state) {
        if (state is AddArticleInProgress) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is AddArticleFailure) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
            msg: "${state.message}",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.black.withOpacity(0.6),
          );
        }
        if (state is AddArticleSuccess) {
          // setState(() {
          //   userData = state.login.user;
          // });
          Fluttertoast.showToast(
            msg: "${state.data.message}",
            gravity: ToastGravity.TOP,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.black.withOpacity(0.6),
          );
          //   if (state.data.user.nom == "Admin") {
          //     // Navigator.of(context).pushReplacementNamed(
          //     //   AdminHomepage
          //     // );
          //   } else {
          //     Navigator.of(context).pushReplacementNamed(
          //       Home,
          //       arguments: state.login.user,
          //     );
          //   }
        }
      },
      child: Padding(
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
            buildTextField(screen,
                hint: "designation", controller: _designationController),
            SizedBox(height: 20),
            buildTextField(screen, hint: "pu", controller: _puController),
            SizedBox(height: 20),
            buildTextField(screen,
                hint: "a props", controller: _aProposController),
            SizedBox(height: 10),
            BlocListener<UpdateArticleBloc, UpdateArticleState>(
              bloc: _updateArticleBloc,
              listener: (context, state) {
                if (state is UpdateArticleInProgress) {
                  setState(() {
                    isLoading = true;
                  });
                }
                if (state is UpdateArticleFailure) {
                  setState(() {
                    isLoading = false;
                  });
                  Fluttertoast.showToast(
                    msg: "${state.message}",
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.black.withOpacity(0.6),
                  );
                }
                if (state is UpdateArticleSuccess) {
                  Navigator.of(context).pop();
                  // setState(() {
                  //   userData = state.login.user;
                  // });
                  Fluttertoast.showToast(
                    msg: "${state.data.message}",
                    gravity: ToastGravity.TOP,
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Colors.black.withOpacity(0.6),
                  );
                  //   if (state.data.user.nom == "Admin") {
                  //     // Navigator.of(context).pushReplacementNamed(
                  //     //   AdminHomepage
                  //     // );
                  //   } else {
                  //     Navigator.of(context).pushReplacementNamed(
                  //       Home,
                  //       arguments: state.login.user,
                  //     );
                  //   }
                }
              },
              child: ClickAnimation(
                onTap: () {
                  widget.articleData == null
                      ? _onAddButtonPressed()
                      : _onUpdateButtonPressed();
                },
                child: !isLoading
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        decoration: BoxDecoration(
                          color: AppTheme.blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Enregistrer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                    : CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.grey[400]),
                      ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  buildTextField(screen, {String hint, TextEditingController controller}) {
    return Column(
      children: [
        Container(
          width: screen.width * .80,
          child: TextField(
            controller: controller,
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

  Future<void> _onAddButtonPressed() async {
    Article data = Article(
        designation: _designationController.text.trim(),
        pu: _puController.text.trim(),
        aPropos: _aProposController.text.trim());
    _addArticleBloc.add(
      AddArticleButtonPressed(
        data: data,
        image1: _image1,
        image2: _image2,
        image3: _image3,
      ),
    );
  }

  Future<void> _onUpdateButtonPressed() async {
    Article data = Article(
        id: widget.articleData.id,
        designation: _designationController.text.trim(),
        pu: _puController.text.trim(),
        aPropos: _aProposController.text.trim());
    _updateArticleBloc.add(UpdateArticleButtonPressed(data: data));
  }
}
