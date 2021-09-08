import 'package:e_commerce/exports/all_exports.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({ Key? key }) : super(key: key);
  final User userData;
  ProfilePage(this.userData);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screen.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Text('${userData.nom}'),
            Text('${userData.contact}'),
          ],
        ),
      ),
    );
  }
}
