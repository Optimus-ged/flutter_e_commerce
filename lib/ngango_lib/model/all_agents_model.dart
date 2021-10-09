class AllAgents {
  String message;
  List<Agents> agents;

  AllAgents({this.message, this.agents});

  AllAgents.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Agents'] != null) {
      agents = <Agents>[];
      json['Agents'].forEach((v) {
        agents.add(new Agents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.agents != null) {
      data['Agents'] = this.agents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Agents {
  int id;
  String adressephysique;
  String etatcivil;
  String lieunaissance;
  String nom;
  String photo;
  String postnom;
  String sexe;
  String prenom;
  String telephone;
  String motDePasse;

  Agents(
      {this.id,
      this.adressephysique,
      this.etatcivil,
      this.lieunaissance,
      this.nom,
      this.photo,
      this.postnom,
      this.sexe,
      this.prenom,
      this.telephone,
      this.motDePasse});

  Agents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adressephysique = json['adressephysique'];
    etatcivil = json['etatcivil'];
    lieunaissance = json['lieunaissance'];
    nom = json['nom'];
    photo = json['photo'];
    postnom = json['postnom'];
    sexe = json['sexe'];
    prenom = json['prenom'];
    telephone = json['telephone'];
    motDePasse = json['mot_de_passe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adressephysique'] = this.adressephysique;
    data['etatcivil'] = this.etatcivil;
    data['lieunaissance'] = this.lieunaissance;
    data['nom'] = this.nom;
    data['photo'] = this.photo;
    data['postnom'] = this.postnom;
    data['sexe'] = this.sexe;
    data['prenom'] = this.prenom;
    data['telephone'] = this.telephone;
    data['mot_de_passe'] = this.motDePasse;
    return data;
  }
}
