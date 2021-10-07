import 'package:e_commerce/optimus_lib/bloc/profile_bloc/profile_bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/profile_bloc/profile_event.dart';
import 'package:e_commerce/optimus_lib/bloc/profile_bloc/profile_state.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io' as Io;

import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  // const ProfilePage({ Key? key }) : super(key: key);
  final Users userData;
  ProfilePage(this.userData);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading;
  ProfileBloc _profileBloc;
  Io.File _image;
  var _controllerNom = TextEditingController();
  var _controllerContact = TextEditingController();
  var _controllerPwd = TextEditingController();

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = Io.File(pickedFile.path);
    });
  }

  @override
  void initState() {
    isLoading = false;
    _controllerNom = TextEditingController(text: '${widget.userData.nom}');
    _controllerContact =
        TextEditingController(text: '${widget.userData.contact}');
    _controllerPwd = TextEditingController(text: 'oooooooo');
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state is ProfileInProgress) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is ProfileFailure) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(
              msg: "${state.data}",
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.black.withOpacity(0.6),
            );
          }
          if (state is ProfileSuccess) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(
              msg: "${state.data.message}",
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.black.withOpacity(0.6),
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            height: screen.height,
            width: screen.width,
            color: Colors.grey[50],
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
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "PROFILE",
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Container(
                      width: screen.width,
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: _image == null
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),
                                    child: Image.network(
                                      "${Endpoint.uplaod}${widget.userData.photo}",
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: AppTheme.pinkColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.file(
                                        _image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 10),
                          ClickAnimation(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  "Parcourir",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CustomTextField(
                            hint: "${widget.userData.nom}",
                            isFirst: true,
                            obscureText: false,
                            top: screen.height * .05,
                            controller: _controllerNom,
                          ),
                          CustomTextField(
                            hint: "${widget.userData.contact}",
                            isFirst: true,
                            obscureText: false,
                            top: screen.height * .05,
                            controller: _controllerContact,
                          ),
                          CustomTextField(
                            hint: "********",
                            isFirst: true,
                            obscureText: true,
                            top: screen.height * .05,
                            controller: _controllerPwd,
                          ),
                          SizedBox(height: screen.height * .05),
                          ClickAnimation(
                            onTap: () {
                              _onUpdateButtonPressed();
                            },
                            child: Container(
                              height: 38,
                              width: 180,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppTheme.pinkColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: isLoading
                                  ? Container(
                                      height: 28,
                                      width: 28,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Modifier",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onUpdateButtonPressed() async {
    Users _data = Users(
      id: widget.userData.id,
      nom: _controllerNom.text.trim(),
      contact: _controllerContact.text.trim(),
      motDePasse: _controllerPwd.text.trim(),
    );

    _profileBloc.add(ProfileButtonPressed(image: _image, data: _data));
  }
}
