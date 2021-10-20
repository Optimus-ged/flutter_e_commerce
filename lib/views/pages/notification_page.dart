import 'package:e_commerce/views/shared/shared_index.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Container(
          child: Column(
            children: [
              Container(
                width: screen.width,
                height: 60,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    _notifItem(data: 'Optimus tec'),
                    _notifItem(data: 'Kivu green'),
                    _notifItem(data: 'Connectis'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _notifItem({String data}) {
    return ListTile(
      minVerticalPadding: 5,
      leading: Container(
        decoration: BoxDecoration(
            color: CustomTheme.orangeColor,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.payments_outlined, size: 30),
        ),
      ),
      title: Text('$data'),
      subtitle: Text(
        'L\'entreprise $data est en retard de paiement',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
