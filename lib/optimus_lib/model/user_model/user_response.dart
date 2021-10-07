import 'package:e_commerce/optimus_lib/model/user_model/user.dart';

class UserResponse {
  int status;
  int count;
  List<Users> users;

  UserResponse({this.status, this.count, this.users});

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) => users.add(Users.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['count'] = this.count;
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IdentityResponse {
  int status;
  Users user;

  IdentityResponse({this.status, this.user});

  IdentityResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new Users.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
     if (this.user != null) {
      data['response'] = this.user.toJson();
    }
    return data;
  }
}
