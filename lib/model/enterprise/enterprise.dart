class Enterprise {
  int id;
  String numRccm;
  String numImpotNational;
  String idNational;
  String numMatricule;
  String intitule;
  String photo;
  String description;
  String idAgent;
  String idContribuable;
  String createdAt;
  String updatedAt;
  Declaration declaration;

  Enterprise(
      {this.id,
      this.numRccm,
      this.numImpotNational,
      this.idNational,
      this.numMatricule,
      this.intitule,
      this.photo,
      this.description,
      this.idAgent,
      this.idContribuable,
      this.createdAt,
      this.updatedAt,
      this.declaration});

  Enterprise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numRccm = json['num_rccm'];
    numImpotNational = json['num_impot_national'];
    idNational = json['id_national'];
    numMatricule = json['num_matricule'];
    intitule = json['intitule'];
    photo = json['photo'];
    description = json['description'];
    idAgent = json['id_agent'];
    idContribuable = json['id_contribuable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    declaration = json['declaration'] != null
        ? new Declaration.fromJson(json['declaration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num_rccm'] = this.numRccm;
    data['num_impot_national'] = this.numImpotNational;
    data['id_national'] = this.idNational;
    data['num_matricule'] = this.numMatricule;
    data['intitule'] = this.intitule;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['id_agent'] = this.idAgent;
    data['id_contribuable'] = this.idContribuable;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.declaration != null) {
      data['declaration'] = this.declaration.toJson();
    }
    return data;
  }
}

class Declaration {
  int id;
  int idEntreprise;
  int idPaiement;
  String createdAt;
  String updatedAt;
  Paiement paiement;

  Declaration(
      {this.id,
      this.idEntreprise,
      this.idPaiement,
      this.createdAt,
      this.updatedAt,
      this.paiement});

  Declaration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idEntreprise = json['id_entreprise'];
    idPaiement = json['id_paiement'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    paiement = json['paiement'] != null
        ? new Paiement.fromJson(json['paiement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_entreprise'] = this.idEntreprise;
    data['id_paiement'] = this.idPaiement;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.paiement != null) {
      data['paiement'] = this.paiement.toJson();
    }
    return data;
  }
}

class Paiement {
  int id;
  var montant;

  Paiement({this.id, this.montant});

  Paiement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    montant = json['montant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['montant'] = this.montant;
    return data;
  }
}
