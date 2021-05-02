import 'package:e_commerce/exports/all_exports.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.blueColor,
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
                    color: CustomColors.whiteColor,
                    letterSpacing: 5,
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
                    _builTitle(title: "S'inscrire"),
                    _buildDivider(),
                    _builTitle(title: "Se connecter"),
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
                  color: CustomColors.pinkColor,
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
                  color: CustomColors.greyColor,
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
  Widget _builTitle({String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text("$title", style: _notActive()),
    );
  }

  // Building textStyle
  TextStyle _notActive() {
    return TextStyle(
      fontSize: 18,
      color: CustomColors.greyColor,
    );
  }

  // Build the divider between both textes
  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 25,
        width: 0.2,
        color: CustomColors.greyColor,
      ),
    );
  }

  // Building text field
  Widget _buildTextField({String hint, bool isFirst, bool obscureText}) {
    EdgeInsets edgeInsets1 = EdgeInsets.only(top: 50, left: 10, right: 10);
    EdgeInsets edgeInsets2 = EdgeInsets.only(top: 20, left: 10, right: 10);
    return Padding(
      padding: isFirst ? edgeInsets1 : edgeInsets2,
      child: Container(
        child: TextField(
          cursorColor: CustomColors.greyColor,
          obscureText: obscureText,
          style: TextStyle(
            fontSize: 17,
            color: CustomColors.greyColor,
          ),
          decoration: InputDecoration(
            hintText: "$hint",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }
}
