class UserResponse {
  int status;
  int count;
  List<User> user;

  UserResponse({this.status, this.count, this.user});

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['count'] = this.count;
    if (this.user != null) {
      data['user'] = this.user.map((v) => v.toJson()).toList();
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
