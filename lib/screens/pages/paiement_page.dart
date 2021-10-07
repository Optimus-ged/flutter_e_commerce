import 'package:e_commerce/bloc/paiemenst_bloc/all_paiements.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/paiement/get_all_paiement.dart';
import 'package:flutter/material.dart';

import 'payments_details.dart';

class AllPaiementsPage extends StatefulWidget {
  const AllPaiementsPage({Key key}) : super(key: key);

  @override
  _AllPaiementsPageState createState() => _AllPaiementsPageState();
}

class _AllPaiementsPageState extends State<AllPaiementsPage> {
  get _allPaiements => locator.get<GetPaiementsBloc>();
  var _searchController = TextEditingController();
  List<Response> _allPaiementsList = [];
  List<Widget> allPaiementsListWidgets = [];

  @override
  void initState() {
    _allPaiements.getAllPaiemenst();
    super.initState();
  }

  _filterList(List<Response> allPaiementsList) {
    allPaiementsList = [];
    allPaiementsList.addAll(_allPaiementsList);
    allPaiementsListWidgets = [];
    if (_searchController.text.isNotEmpty) {
      allPaiementsList.retainWhere(
        (e) {
          return e.user.nom.toUpperCase().contains(
                _searchController.text.toUpperCase(),
              );
        },
      );
    }

    allPaiementsList.forEach(
      (e) {
        allPaiementsListWidgets.add(
          _buildListItem(e),
        );
      },
    );
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
                  _allPaiementsList.clear();
                  _allPaiementsList.addAll(snapshot.data.response);
                  _filterList(snapshot.data.response);
                  return Container(
                    // color: Colors.black,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: allPaiementsListWidgets.length,
                      itemBuilder: (context, index) =>
                          allPaiementsListWidgets[index],
                    ),
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height / 2,
                  alignment: Alignment.center,
                  child: Text(
                    'Chargement...',
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  _buildListItem(Response paieData) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PaymentsDetails(
            paiementData: paieData,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Image.network(
                  "${Endpoint.uplaod}${paieData.user.photo}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${paieData.user.nom.toUpperCase()}',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Achat : ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '${paieData.montant}\$',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Text('Achat : ${paieData.montant}\$',
                  //     style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            Spacer(),
            Text('${paieData.createdAt.split(' ').last.substring(0, 5)}',
                style: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );
  }
}
