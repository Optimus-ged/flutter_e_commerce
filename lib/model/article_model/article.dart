class Article {
  int id;
  String designation;
  dynamic pu;
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
      photoArticles = <PhotoArticles>[];
      json['photo_articles'].forEach((v) {
        photoArticles.add(PhotoArticles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['designation'] = this.designation;
    data['pu'] = this.pu;
    data['a_propos'] = this.aPropos;
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
}
