class Users {
  int id;
  String nom;
  String contact;
  String motDePasse;
  String photo;

  Users({this.id, this.nom, this.contact, this.motDePasse, this.photo});

  Users.fromJson(Map<String, dynamic> json) {
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

class OneUser {
  int status;
  String message;
  Users users;

  OneUser({this.status, this.message, this.users});

  OneUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['users'] != null) {
      users = Users.fromJson(json['users']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.users != null) {
      data['users'] = this.users.toJson();
    }
    return data;
  }
}
