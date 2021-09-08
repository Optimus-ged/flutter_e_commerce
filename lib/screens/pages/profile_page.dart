import 'package:e_commerce/exports/all_exports.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({ Key? key }) : super(key: key);
  final User userData;
  ProfilePage(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${userData.nom}'),
      ),
    );
  }
}
