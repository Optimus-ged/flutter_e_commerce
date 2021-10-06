import 'package:e_commerce/bloc/paiemenst_bloc/all_paiements.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/paiement/get_all_paiement.dart';
import 'package:flutter/material.dart';

class AllPaiementsPage extends StatefulWidget {
  const AllPaiementsPage({Key key}) : super(key: key);

  @override
  _AllPaiementsPageState createState() => _AllPaiementsPageState();
}

class _AllPaiementsPageState extends State<AllPaiementsPage> {
  get _allPaiements => locator.get<GetPaiementsBloc>();
  List<Response> _allPaiementsList = [];
  List<Widget> _allPaiementsListWidgets = [];

  @override
  void initState() {
    _allPaiements.getAllPaiemenst();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 24),
            Container(
              child: Container(
                // width: screen.width,
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
                        "PAIEMENTS",
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
            ),
            StreamBuilder<AllPaiementsResponse>(
                stream: _allPaiements.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _allPaiementsList.addAll(snapshot.data.response);
                    return Container(
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: snapshot.data.response.length,
                        itemBuilder: (context, index) => _buildListItem(),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                })
          ],
        ),
      ),
    );
  }

  _buildListItem() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 100,
      width: 100,
      color: Colors.amber,
    );
  }
}
