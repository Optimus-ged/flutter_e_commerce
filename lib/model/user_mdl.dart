class UserList {
  int status;
  int count;
  List<Users> users;

  UserList({this.status, this.count, this.users});

  UserList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['count'] = this.count;
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
