import '../models_index.dart';

class LoginResponse {
  int status;
  String message;
  Contribuable contribuable;

  LoginResponse({this.status, this.message, this.contribuable});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    contribuable = json['contribuable'] != null
        ? new Contribuable.fromJson(json['contribuable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.contribuable != null) {
      data['contribuable'] = this.contribuable.toJson();
    }
    return data;
  }
}

