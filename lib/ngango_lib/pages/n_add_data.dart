import 'package:e_commerce/ngango_lib/bloc/ajout_agent_bloc/n_ajout_agent_bloc.dart';
import 'package:e_commerce/ngango_lib/bloc/ajout_agent_bloc/n_ajout_agent_event.dart';
import 'package:e_commerce/ngango_lib/bloc/ajout_agent_bloc/n_ajout_agent_state.dart';
import 'package:e_commerce/ngango_lib/model/all_agents_model.dart';
import 'package:e_commerce/ngango_lib/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io' as Io;

import 'package:image_picker/image_picker.dart';

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

  String sexeChoosed = '';
  String etatCivilChoosed = '';

  Io.File _image;
  bool isLoading;
  AjoutAgentBloc _ajoutAgentBloc;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = Io.File(pickedFile.path);
    });
  }

  @override
  void initState() {
    isLoading = false;
    _ajoutAgentBloc = BlocProvider.of<AjoutAgentBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AjoutAgentBloc, AjoutAgentState>(
        bloc: _ajoutAgentBloc,
        listener: (context, state) {
          if (state is AjoutAgentInProgress) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is AjoutAgentFailure) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(
              msg: "${state.message}",
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.black.withOpacity(0.6),
            );
          }
          if (state is AjoutAgentSuccess) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(
              msg: "Agent Ajoute avec successsss !!!",
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.black.withOpacity(0.6),
            );
          }
        },
        child: Container(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: InkWell(
                            onTap: () {
                              getImage();
                            },
                            child: _image == null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Color(0xffAA000A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Color(0xffAA000A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.file(
                                        _image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        _card(_nomController, title: 'Nom'),
                        _card(_postnomController, title: 'Postnom'),
                        _card(_prenomController, title: 'Prenom'),
                        _card(_phoneController, title: 'Telephone'),
                        _card(_lieuController, title: 'Lieu de naiss'),
                        _card(_addresseomController,
                            title: 'Addresse physique'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                                      etatCivilChoosed = value;
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
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
                                      sexeChoosed = value;
                                    },
                                  )
                                },
                              ),
                            ),
                          ),
                        ),
                        _card(_passwordController, title: 'Mot de passe'),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            // _onSignupButtonPressed();
                            _onAjoutagentButtonPressed();
                          },
                          child: !isLoading
                              ? Container(
                                  height: 38,
                                  width: 180,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffAA000A),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "Creer un compte",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 28,
                                  width: 28,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                        Color(0xffAA000A)),
                                  ),
                                ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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

  Future<void> _onAjoutagentButtonPressed() async {
    CreateAgent agentData = CreateAgent(
      adressephysique: _addresseomController.text.trim(),
      etatcivil: etatCivilChoosed,
      lieunaissance: _lieuController.text.trim(),
      nom: _nomController.text.trim(),
      postnom: _postnomController.text.trim(),
      sexe: sexeChoosed,
      prenom: _prenomController.text.trim(),
      telephone: _phoneController.text.trim(),
      motDePasse: _passwordController.text.trim(),
    );
    _ajoutAgentBloc.add(
      AjoutAgentButtonPressed(agentData: agentData, file: _image),
    );
  }
}
