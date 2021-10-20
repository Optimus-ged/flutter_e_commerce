class Contribuable {
  String id;
  int idNumImpot;
  String createdAt;
  String updatedAt;
  NumImpot numImpot;
  String nom;
  String prenom;
  String postnom;
  String sexe;
  String mailAddresse;
  String telephone;
  String photo;
  String addresse;
  String userName;
  String password;
  String token;

  Contribuable(
      {this.id,
      this.idNumImpot,
      this.createdAt,
      this.updatedAt,
      this.numImpot,
      this.nom,
      this.prenom,
      this.postnom,
      this.sexe,
      this.mailAddresse,
      this.telephone,
      this.photo,
      this.addresse,
      this.userName,
      this.password,
      this.token});

  Contribuable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idNumImpot = json['id_num_impot'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    numImpot = json['num_impot'] != null
        ? new NumImpot.fromJson(json['num_impot'])
        : null;
    nom = json['nom'];
    prenom = json['prenom'];
    postnom = json['postnom'];
    sexe = json['sexe'];
    mailAddresse = json['mail_addresse'];
    telephone = json['telephone'];
    photo = json['photo'];
    addresse = json['addresse'];
    userName = json['user_name'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_num_impot'] = this.idNumImpot;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.numImpot != null) {
      data['num_impot'] = this.numImpot.toJson();
    }
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['postnom'] = this.postnom;
    data['sexe'] = this.sexe;
    data['mail_addresse'] = this.mailAddresse;
    data['telephone'] = this.telephone;
    data['photo'] = this.photo;
    data['addresse'] = this.addresse;
    data['user_name'] = this.userName;
    data['password'] = this.password;
    data['token'] = this.token;
    return data;
  }
}

class NumImpot {
  String numImpotNational;

  NumImpot({this.numImpotNational});

  NumImpot.fromJson(Map<String, dynamic> json) {
    numImpotNational = json['num_impot_national'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num_impot_national'] = this.numImpotNational;
    return data;
  }
}
