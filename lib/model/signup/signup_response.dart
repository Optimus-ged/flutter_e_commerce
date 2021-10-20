import '../models_index.dart';

class SignupResponse {
  int status;
  String message;
  Contribuable contribuable;

  SignupResponse({this.status, this.message, this.contribuable});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.contribuable != null) {
      data['contribuable'] = this.contribuable.toJson();
    }
    return data;
  }

  SignupResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    contribuable = json['contribuable'] != null
        ? new Contribuable.fromJson(json['contribuable'])
        : null;
    message = json['message'];
  }
}
