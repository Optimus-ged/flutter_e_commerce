class AllPaiementsResponse {
  int status;
  String message;
  int length;
  List<Response> response;

  AllPaiementsResponse({this.status, this.message, this.length, this.response});

  AllPaiementsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    length = json['length'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['length'] = this.length;
    if (this.response != null) {
      data['response'] = this.response.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  int id;
  int idUser;
  double montant;
  String createdAt;
  String updatedAt;
  User user;
  List<DetailsPaiements> detailsPaiements;

  Response(
      {this.id,
      this.idUser,
      this.montant,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.detailsPaiements});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['idUser'];
    montant = json['montant'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['details_paiements'] != null) {
      detailsPaiements = new List<DetailsPaiements>();
      json['details_paiements'].forEach((v) {
        detailsPaiements.add(new DetailsPaiements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idUser'] = this.idUser;
    data['montant'] = this.montant;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.detailsPaiements != null) {
      data['details_paiements'] =
          this.detailsPaiements.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int id;
  String nom;
  String contact;
  String motDePasse;
  String photo;

  User({this.id, this.nom, this.contact, this.motDePasse, this.photo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    contact = json['contact'];
    motDePasse = json['mot_de_passe'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['contact'] = this.contact;
    data['mot_de_passe'] = this.motDePasse;
    data['photo'] = this.photo;
    return data;
  }
}

class DetailsPaiements {
  int id;
  int idEntete;
  int idArticle;
  int qteAchete;
  Article article;

  DetailsPaiements(
      {this.id, this.idEntete, this.idArticle, this.qteAchete, this.article});

  DetailsPaiements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idEntete = json['idEntete'];
    idArticle = json['idArticle'];
    qteAchete = json['qte_achete'];
    article =
        json['article'] != null ? new Article.fromJson(json['article']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idEntete'] = this.idEntete;
    data['idArticle'] = this.idArticle;
    data['qte_achete'] = this.qteAchete;
    if (this.article != null) {
      data['article'] = this.article.toJson();
    }
    return data;
  }
}

class Article {
  int id;
  String designation;
  double pu;
  String aPropos;
  List<PhotoArticles> photoArticles;

  Article(
      {this.id, this.designation, this.pu, this.aPropos, this.photoArticles});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    pu = json['pu'];
    aPropos = json['a_propos'];
    if (json['photo_articles'] != null) {
      photoArticles = new List<PhotoArticles>();
      json['photo_articles'].forEach((v) {
        photoArticles.add(new PhotoArticles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['designation'] = this.designation;
    data['pu'] = this.pu;
    data['a_propos'] = this.aPropos;
    if (this.photoArticles != null) {
      data['photo_articles'] =
          this.photoArticles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhotoArticles {
  int id;
  String photoArticle;
  int idArticle;

  PhotoArticles({this.id, this.photoArticle, this.idArticle});

  PhotoArticles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photoArticle = json['photo_article'];
    idArticle = json['id_article'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo_article'] = this.photoArticle;
    data['id_article'] = this.idArticle;
    return data;
  }
}
