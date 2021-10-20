class SignupSubmit {
  String username;
  String password;
  String numImpotNational;

  SignupSubmit({this.username, this.password, this.numImpotNational});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.username;
    data['password_from_body'] = this.password;
    data['num_impot_national'] = this.numImpotNational;
    return data;
  }
}

class ProfileSubmit {
  String username;
  String password;
  String telephone;
  String addresse;
  String mailAddresse;

  ProfileSubmit({
    this.username,
    this.password,
    this.telephone,
    this.addresse,
    this.mailAddresse,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.username;
    data['password_from_body'] = this.password;
    data['telephone'] = this.telephone;
    data['addresse'] = this.addresse;
    data['mail_addresse'] = this.mailAddresse;
    return data;
  }
}
