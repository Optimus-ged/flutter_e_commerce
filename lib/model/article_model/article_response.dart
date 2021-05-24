import 'package:e_commerce/exports/all_exports.dart';

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

