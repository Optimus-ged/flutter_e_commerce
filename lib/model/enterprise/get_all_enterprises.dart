import 'enterprise.dart';

class GetAllEnterprisesResponse {
  int status;
  String message;
  List<Enterprise> entreprises;

  GetAllEnterprisesResponse({this.status, this.message, this.entreprises});

  GetAllEnterprisesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['entreprises'] != null) {
      entreprises = <Enterprise>[];
      json['entreprises'].forEach((v) {
        entreprises.add(new Enterprise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.entreprises != null) {
      data['entreprises'] = this.entreprises.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

