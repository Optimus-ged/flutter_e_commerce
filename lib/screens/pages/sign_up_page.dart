import 'package:e_commerce/exports/all_exports.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.blueColor,
      body: ScrollConfiguration(
        behavior: RemoveGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screen.height * .28,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "UZISHA",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.lessWhiteColor,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: screen.height * .12),
              Container(
                // color: Colors.black38,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _builTitle(
                      title: "S'inscrire",
                      isActive: true,
                    ),
                    _buildDivider(),
                    _builTitle(
                      title: "Se connecter",
                      isActive: false,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              _buildTextField(
                  hint: "Nom d'utilisateur ou email",
                  isFirst: true,
                  obscureText: false,
                  top: screen.height * .05),
              _buildTextField(
                hint: "Numero de telephone",
                isFirst: false,
                obscureText: true,
              ),
              _buildTextField(
                hint: "Mot de passe",
                isFirst: false,
                obscureText: true,
              ),
              SizedBox(height: screen.height * .05),
              ClickAnimation(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.pinkColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Text(
                    "Créer un compte",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screen.height * .15)
            ],
          ),
        ),
      ),
    );
  }

  // Building text titles
  Widget _builTitle({String title, bool isActive, VoidCallback onTap}) {
    return ClickAnimation(
      onTap: onTap,
      child: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text("$title", style: _notActive()),
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

  // Building textStyle
  TextStyle _notActive() {
    return TextStyle(
      fontSize: 16,
      color: AppTheme.greyColor,
    );
  }

  // Build the divider between both textes
  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 25,
        width: 0.2,
        color: AppTheme.greyColor,
      ),
    );
  }

  // Building text field
  Widget _buildTextField(
      {String hint, double top, bool isFirst, bool obscureText}) {
    EdgeInsets edgeInsets1 = EdgeInsets.only(top: top, left: 10, right: 10);
    EdgeInsets edgeInsets2 = EdgeInsets.only(top: 20, left: 10, right: 10);
    return Padding(
      padding: isFirst ? edgeInsets1 : edgeInsets2,
      child: Container(
        child: TextField(
          textAlign: TextAlign.center,
          cursorColor: AppTheme.greyColor,
          obscureText: obscureText,
          style: TextStyle(
            fontSize: 17,
            color: AppTheme.greyColor,
          ),
          decoration: InputDecoration(
            hintText: "$hint",
            enabledBorder: _outlineBorder(color: AppTheme.lessWhiteColor),
            focusedBorder: _outlineBorder(color: AppTheme.pinkColor),
            hintStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }

  // Building custom outline borders
  OutlineInputBorder _outlineBorder({Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      gapPadding: 0,
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}
