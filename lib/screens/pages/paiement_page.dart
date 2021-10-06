import 'package:e_commerce/bloc/paiemenst_bloc/all_paiements.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:flutter/material.dart';

class AllPaiementsPage extends StatefulWidget {
  const AllPaiementsPage({Key key}) : super(key: key);

  @override
  _AllPaiementsPageState createState() => _AllPaiementsPageState();
}

class _AllPaiementsPageState extends State<AllPaiementsPage> {
  get _allPaiements => locator.get<GetPaiementsBloc>();

  @override
  void initState() {
    _allPaiements.getAllPaiemenst();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('all paiemenets'),
      ),
    );
  }
}
