import 'package:e_commerce/exports/all_exports.dart';

class LoginPage extends StatelessWidget {
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
              SizedBox(height: 100),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _builTitle(title: "S'inscrire", isActive: false),
                    _buildDivider(),
                    _builTitle(title: "Se connecter", isActive: true),
                  ],
                ),
              ),
              _buildTextField(
                hint: "Nom d'utilisateur ou email",
                isFirst: true,
                obscureText: false,
              ),
              _buildTextField(
                hint: "Mot de passe",
                isFirst: false,
                obscureText: true,
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.pinkColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Text(
                  "Connexion",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Mot de passe oublié",
                style: TextStyle(
                  color: AppTheme.greyColor,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }

  // Building text titles
  Widget _builTitle({String title, bool isActive}) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text("$title", style: _notActive()),
          ),
          isActive
              ? Positioned(
                  bottom: 0,
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
  Widget _buildTextField({String hint, bool isFirst, bool obscureText}) {
    EdgeInsets edgeInsets1 = EdgeInsets.only(top: 40, left: 10, right: 10);
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
      gapPadding: 2,
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}
