class LoginResponse {
  int status;
  String message;
  String token;
  User user;

  LoginResponse({this.status, this.message, this.token, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
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
