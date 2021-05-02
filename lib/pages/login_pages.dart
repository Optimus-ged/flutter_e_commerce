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
                color: Colors.grey,
                height: screen.height * .28,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "UZISHA",
                  style: TextStyle(
                    fontSize: 30,
                    color: CustomColors.whiteColor,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Building text field
  Widget _buildTextField() {
    return TextField();
  }
}
