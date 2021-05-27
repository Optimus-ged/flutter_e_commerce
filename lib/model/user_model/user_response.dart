import 'package:e_commerce/exports/all_exports.dart';

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

class OneUser {
  int status;
  String message;
  Users users;

  OneUser({this.status, this.message, this.users});

  OneUser.fromJson(Map<String, dynamic> json) {
    status = json['satus'];
    message = json['message'];
    if (json['users'] != null) {
      users = Users.fromJson(json['users']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.users != null) {
      data['users'] = this.users.toJson();
    }
    return data;
  }
}
