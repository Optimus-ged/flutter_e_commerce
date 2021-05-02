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
                // color: Colors.grey,
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
              SizedBox(height: 60),
              Container(
                // color: Colors.black,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _builTitle(),
                    _buildDivider(),
                    _builTitle(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Building text titles
  Widget _builTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text("S'inscrire", style: _notActive()),
    );
  }

  // Building textStyle
  TextStyle _notActive() {
    return TextStyle(
      fontSize: 20,
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
  Widget _buildTextField() {
    return TextField();
  }
}
