class CreatePaiement {
  int idUser;
  double montant;
  List<DataList> dataList;

  CreatePaiement({this.idUser, this.montant, this.dataList});

  CreatePaiement.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    montant = json['montant'];
    if (json['dataList'] != null) {
      dataList = <DataList>[];
      json['dataList'].forEach((v) {
        dataList.add(new DataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser;
    data['montant'] = this.montant;
    if (this.dataList != null) {
      data['dataList'] = this.dataList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  int idArticle;
  var qteAchete;

  DataList({this.idArticle, this.qteAchete});

  DataList.fromJson(Map<String, dynamic> json) {
    idArticle = json['idArticle'];
    qteAchete = json['qte_achete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idArticle'] = this.idArticle;
    data['qte_achete'] = this.qteAchete;
    return data;
  }
}