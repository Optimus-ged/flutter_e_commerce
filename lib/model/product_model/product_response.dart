class ListeArticles {
  int status;
  String message;
  int length;
  List<Article> response;

  ListeArticles({this.status, this.message, this.length, this.response});

  ListeArticles.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    length = json['length'];
    if (json['response'] != null) {
      response = <Article>[];
      json['response'].forEach((v) {
        response.add(new Article.fromJson(v));
      });
    }
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
      photoArticles = <PhotoArticles>[];
      json['photo_articles'].forEach((v) {
        photoArticles.add(new PhotoArticles.fromJson(v));
      });
    }
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
