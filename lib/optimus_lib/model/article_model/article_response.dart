

import 'article.dart';

class ListeArticles {
  int status;
  String message;
  int length;
  List<Article> articles;

  ListeArticles({this.status, this.message, this.length, this.articles});

  ListeArticles.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    length = json['length'];
    if (json['response'] != null) {
      articles = <Article>[];
      json['response'].forEach((v) {
        articles.add(new Article.fromJson(v));
      });
    }
  }
}
