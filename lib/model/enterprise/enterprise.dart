class Enterprise {
  int id;
  String photo;
  String idContribuable;
  String numRccm;
  String numImpotNational;
  String idNational;
  String numMatricule;
  String intitule;
  String description;
  String idAgent;
  String updatedAt;
  String createdAt;

  Enterprise(
      {this.id,
      this.photo,
      this.idContribuable,
      this.numRccm,
      this.numImpotNational,
      this.idNational,
      this.numMatricule,
      this.intitule,
      this.description,
      this.idAgent,
      this.updatedAt,
      this.createdAt});

  Enterprise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    idContribuable = json['id_contribuable'];
    numRccm = json['num_rccm'];
    numImpotNational = json['num_impot_national'];
    idNational = json['id_national'];
    numMatricule = json['num_matricule'];
    intitule = json['intitule'];
    description = json['description'];
    idAgent = json['id_agent'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['id_contribuable'] = this.idContribuable;
    data['num_rccm'] = this.numRccm;
    data['num_impot_national'] = this.numImpotNational;
    data['id_national'] = this.idNational;
    data['num_matricule'] = this.numMatricule;
    data['intitule'] = this.intitule;
    data['description'] = this.description;
    data['id_agent'] = this.idAgent;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
