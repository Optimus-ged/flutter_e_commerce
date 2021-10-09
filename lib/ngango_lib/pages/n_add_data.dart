import 'package:e_commerce/ngango_lib/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NAddData extends StatefulWidget {
  final int currentTap;
  const NAddData({Key key, @required this.currentTap}) : super(key: key);

  @override
  _NAddDataState createState() => _NAddDataState();
}

class _NAddDataState extends State<NAddData> {
  var _nomController = TextEditingController();
  var _postnomController = TextEditingController();
  var _prenomController = TextEditingController();

  var _phoneController = TextEditingController();
  var _lieuController = TextEditingController();
  var _addresseomController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyAppbar(
              title: 'AJOUTER UN AGENT',
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _card(_nomController, title:'Nom'),
                      _card(_postnomController, title: 'Postnom'),
                      _card(_prenomController, title: 'Prenom'),

                       _card(_phoneController, title: 'Telephone'),
                      _card(_lieuController, title: 'Lieu de naiss'),
                      _card(_addresseomController, title: 'Addresse physique'),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: DropdownButtonFormField<String>(
                              icon: Icon(Icons.edit),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              hint: Text("Etat civil"),
                              validator: (value) =>
                                  value.isEmpty ? 'Choisir un taxe.' : null,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Marrie (e)'),
                                  value: "marrie",
                                ),
                                DropdownMenuItem(
                                  child: Text('Celibataire'),
                                  value: "celibataire",
                                ),
                              ],
                              onChanged: (value) => {
                                setState(
                                  () {
                                    // sexe.text = value.toString();
                                  },
                                )
                              },
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: DropdownButtonFormField<String>(
                              icon: Icon(Icons.edit),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              hint: Text("Sexe"),
                              validator: (value) =>
                                  value.isEmpty ? 'Choisir un taxe.' : null,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Homme'),
                                  value: "M",
                                ),
                                DropdownMenuItem(
                                  child: Text('Femme'),
                                  value: "F",
                                ),
                              ],
                              onChanged: (value) => {
                                setState(
                                  () {
                                    // sexe.text = value.toString();
                                  },
                                )
                              },
                            ),
                          ),
                        ),
                      ),

                      _card(_passwordController, title: 'Mot de passe'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _card(controler, {String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: TextFormField(
          controller: controler,
          // keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "$title",
            prefixIcon: Icon(Icons.edit),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
