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
                // color: Colors.amber,
                height: screen.height * .15,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
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
              SizedBox(height: screen.height * .07),
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
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: screen.height * .05),
              CircleAvatar(
                radius: 40,
                backgroundColor: AppTheme.pinkColor,
                child: Icon(Icons.face),
              ),
              CustomTextField(
                hint: "Nom d'utilisateur ou email",
                isFirst: false,
                obscureText: false,
              ),
              CustomTextField(
                hint: "Numero de telephone",
                isFirst: false,
                obscureText: false,
              ),
              CustomTextField(
                hint: "Mot de passe",
                isFirst: false,
                obscureText: true,
              ),
              CustomTextField(
                hint: "Repeter le mot de passe",
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
              SizedBox(height: screen.height * .02)
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
}
