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
                      isActive: false,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SignupPage(),
                          ),
                        );
                      },
                    ),
                    _buildDivider(),
                    _builTitle(title: "Se connecter", isActive: true),
                  ],
                ),
              ),
              CustomTextField(
                  hint: "Nom d'utilisateur ou email",
                  isFirst: true,
                  obscureText: false,
                  top: screen.height * .05),
              CustomTextField(
                hint: "Mot de passe",
                isFirst: false,
                obscureText: true,
              ),
              SizedBox(height: screen.height * .05),
              ClickAnimation(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                },
                child: Container(
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
              ),
              SizedBox(height: 2),
              ClickAnimation(
                onTap: () {},
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Text(
                      "Mot de passe oublié",
                      style: TextStyle(
                        color: AppTheme.greyColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
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
