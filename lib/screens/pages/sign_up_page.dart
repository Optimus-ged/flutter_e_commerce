import 'package:e_commerce/bloc/login_bloc/login_bloc.dart';
import 'package:e_commerce/bloc/sign_bloc/signup_bloc.dart';
import 'package:e_commerce/bloc/sign_bloc/signup_event.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' as Io;

import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();

  final numController = TextEditingController();

  final pwdController = TextEditingController();

  final confirmPwdController = TextEditingController();

  Io.File _image;
  SignupBloc _signupBloc;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = Io.File(pickedFile.path);
    });
  }

  @override
  void initState() {
    _signupBloc = BlocProvider.of<SignupBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return StreamBuilder<UserResponse>(
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: AppTheme.blueColor,
          body: ScrollConfiguration(
            behavior: RemoveGlow(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: screen.height * .15,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        BackwardButton(color: AppTheme.lessWhiteColor),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: screen.width,
                            alignment: Alignment.center,
                            child: Text(
                              "UZISHA",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.lessWhiteColor,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screen.height * .07),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _builTitle(
                          title: "S'inscrire",
                          isActive: true,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 25,
                            width: 0.2,
                            color: AppTheme.greyColor,
                          ),
                        ),
                        _builTitle(
                          title: "Se connecter",
                          isActive: false,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screen.height * .05),
                  ClickAnimation(
                    onTap: () {
                      getImage();
                    },
                    child: _image == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppTheme.pinkColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              height: 80,
                              width: 80,
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
                  CustomTextField(
                    controller: nameController,
                    hint: "Nom d'utilisateur",
                    isFirst: false,
                    obscureText: false,
                  ),
                  CustomTextField(
                    controller: numController,
                    hint: "Numero de telephone",
                    isFirst: false,
                    obscureText: false,
                  ),
                  CustomTextField(
                    controller: pwdController,
                    hint: "Mot de passe",
                    isFirst: false,
                    obscureText: true,
                  ),
                  CustomTextField(
                    controller: confirmPwdController,
                    hint: "Confirmer le mot de passe",
                    isFirst: false,
                    obscureText: true,
                  ),
                  SizedBox(height: screen.height * .05),
                  ClickAnimation(
                    onTap: () {
                      _onSignupButtonPressed();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.pinkColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: Text(
                        "Créer un compte",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screen.height * .02)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _builTitle({String title, bool isActive, VoidCallback onTap}) {
    return ClickAnimation(
      onTap: onTap,
      child: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "$title",
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.greyColor,
                ),
              ),
            ),
            isActive
                ? Positioned(
                    bottom: 4,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: AppTheme.pinkColor,
                        radius: 2,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  // signUpMethod() {
  //   var data = Users(
  //     nom: nameController.text.trim(),
  //     contact: numController.text.trim(),
  //     motDePasse: pwdController.text.trim(),
  //   );
  //   locator.get<SignUpBloc>().signUp(data);
  // }

  Future<void> _onSignupButtonPressed() async {
    if (numController.text.trim() == confirmPwdController.text.trim()) {
      Users _data = Users(
          nom: nameController.text.trim(),
          contact: numController.text.trim(),
          motDePasse: pwdController.text.trim());

      _signupBloc.add(SignUpButtonPressed(image: _image, data: _data));
    }
  }
}
