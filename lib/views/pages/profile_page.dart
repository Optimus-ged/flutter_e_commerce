import 'dart:io' as io;

import 'package:image_picker/image_picker.dart';
import 'package:e_commerce/model/models_index.dart';
import 'package:e_commerce/views/shared/shared_index.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class ProfilePage extends StatefulWidget {
  final Contribuable contribuable;
  const ProfilePage({Key key, @required this.contribuable}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _usernameCtrl = TextEditingController();
  var _passwordCtrl = TextEditingController();
  var _confirmPwdCtrl = TextEditingController();
  var _mailAddresseCtrl = TextEditingController();
  var _phoneNumberCtrl = TextEditingController();
  var _residencyCtrl = TextEditingController();

  // Blu

  bool isPassword = true;
  bool isLogin = true;
  bool isConfirm = true;
  bool isLoading = false;

  UpdateProfileBloc _updateProfileBloc;

  @override
  void initState() {
    _updateProfileBloc = BlocProvider.of<UpdateProfileBloc>(context);
    super.initState();
  }

  io.File _image;
  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = io.File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return BlocListener<UpdateProfileBloc, UpdateProfileState>(
      bloc: _updateProfileBloc,
      listener: (context, state) {
        if (state is UpdateProfileInProgress) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is UpdateProfileFailure) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
            msg: "${state.updateProfile}",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.black.withOpacity(0.6),
          );
        }
        if (state is UpdateProfileSuccess) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
            msg: "${state.updateProfile.message}",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.black.withOpacity(0.6),
          );
        }
      },
      child: Scaffold(
        body: Container(
          height: screen.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 40,
                      right: 40,
                      bottom: 70,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => _updateProfile(),
                          child: Material(
                            elevation: 4,
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: CustomTheme.redColor,
                                  // borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.circle),
                              child: !isLoading
                                  ? Icon(
                                      Icons.verified,
                                      color: Colors.white,
                                    )
                                  : CircularProgressIndicator(
                                      strokeWidth: 8,
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mon profile',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: CustomTheme.greyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Mettre a jour mon profile',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                    bloc: _updateProfileBloc,
                    builder: (context, state) {
                      if (state is UpdateProfileSuccess) {
                        return _formWrapper(state.updateProfile.contribuable);
                      } else {
                        return _formWrapper(widget.contribuable);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _formWrapper(Contribuable contribuable) {
    return Column(
      children: [
        _customAvatar(),
        SizedBox(height: 40),
        _loginInput(
          controller: _usernameCtrl,
          color: CustomTheme.orangeColor,
          hint: '${contribuable.userName}',
        ),
        _loginInput(
          controller: _mailAddresseCtrl,
          color: CustomTheme.greyColor,
          hint: '${contribuable.mailAddresse}',
        ),
        _loginInput(
          controller: _phoneNumberCtrl,
          color: CustomTheme.greyColor,
          hint: '${contribuable.telephone}',
        ),
        _loginInput(
          controller: _residencyCtrl,
          color: CustomTheme.greyColor,
          hint: '${contribuable.addresse}',
        ),
        _loginInput(
          controller: _passwordCtrl,
          color: CustomTheme.greyColor,
          hint: 'mot de passe',
          isPassword: true,
          isLogin: isConfirm,
          onTap: () {
            setState(() {
              isConfirm = !isConfirm;
            });
          },
        ),
        _loginInput(
          controller: _confirmPwdCtrl,
          color: CustomTheme.greyColor,
          hint: 'confirmer mot de passe',
          isPassword: true,
          isLogin: isLogin,
          onTap: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
        ),
      ],
    );
  }

  _customAvatar() {
    return Container(
      // color: Colors.green,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          // alignment: Alignment.center,
          // color: Colors.amber,
          width: 150,
          child: Stack(
            children: [
              Center(
                child: _image == null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          border: Border.all(
                            color: CustomTheme.greyColor,
                            width: 0.1,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/noAvatar.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.file(
                            _image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              Positioned(
                top: 0,
                right: 15,
                child: InkWell(
                  onTap: () => getImage(),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: CustomTheme.redColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      size: 20,
                      color: Colors.white60,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _loginInput(
      {Color color,
      String hint,
      bool isPassword = false,
      bool isLogin = false,
      VoidCallback onTap,
      TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 40, left: 40),
      child: Container(
        height: 35,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          // border: Border(
          //   bottom: BorderSide(
          //     width: 0.5,
          //     color: CustomTheme.greyColor,
          //     style: BorderStyle.solid,
          //   ),
          // ),
        ),
        child: Stack(
          children: [
            TextField(
              controller: controller,
              obscureText: isLogin,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
              decoration: InputDecoration.collapsed(
                hintText: '$hint',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            if (isPassword)
              Positioned(
                  right: 0,
                  top: 0,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Icon(
                          Icons.remove_red_eye_sharp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }

  _updateProfile() {
    ProfileSubmit data = ProfileSubmit(
      username: _usernameCtrl.text.trim(),
      password: _passwordCtrl.text.trim(),
      telephone: _phoneNumberCtrl.text.trim(),
      addresse: _residencyCtrl.text.trim(),
      mailAddresse: _mailAddresseCtrl.text.trim(),
    );
    _updateProfileBloc.add(
      UpdateProfileButtonPressed(
          id: widget.contribuable.id, submitData: data, file: _image),
    );
  }
}
