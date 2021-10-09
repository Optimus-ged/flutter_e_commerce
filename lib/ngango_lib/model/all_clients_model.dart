class ClientsModel {
  String message;
  List<Clients> clients;

  ClientsModel({this.message, this.clients});

  ClientsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients.add(new Clients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.clients != null) {
      data['clients'] = this.clients.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clients {
  int id;
  String nom;
  String photo;
  String sexe;
  String prenom;
  String motDePasse;
  String telephone;

  Clients(
      {this.id,
      this.nom,
      this.photo,
      this.sexe,
      this.prenom,
      this.motDePasse,
      this.telephone});

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    photo = json['photo'];
    sexe = json['sexe'];
    prenom = json['prenom'];
    motDePasse = json['mot_de_passe'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['photo'] = this.photo;
    data['sexe'] = this.sexe;
    data['prenom'] = this.prenom;
    data['mot_de_passe'] = this.motDePasse;
    data['telephone'] = this.telephone;
    return data;
  }
}
