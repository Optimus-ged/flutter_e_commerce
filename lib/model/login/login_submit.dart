class LoginSubmit {
  String username;
  String password;

  LoginSubmit({this.username, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.username;
    data['password_from_body'] = this.password;
    return data;
  }
}
