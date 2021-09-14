import 'package:e_commerce/exports/all_exports.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({ Key? key }) : super(key: key);
  final User userData;
  ProfilePage(this.userData);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    var _controllerNom = TextEditingController();
    var _controllerContact = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
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
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: Image.network(
                                "${Endpoint.uplaod}${userData.photo}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          CustomTextField(
                            hint: "${userData.nom}",
                            isFirst: true,
                            obscureText: false,
                            top: screen.height * .05,
                            controller: _controllerNom,
                          ),
                          CustomTextField(
                            hint: "${userData.contact}",
                            isFirst: true,
                            obscureText: false,
                            top: screen.height * .05,
                            controller: _controllerContact,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
