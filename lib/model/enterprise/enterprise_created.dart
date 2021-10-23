import 'enterprise.dart';

class CreateEnterpriseResponse {
  int status;
  String message;
  Enterprise enterprise;

  CreateEnterpriseResponse({this.status, this.message, this.enterprise});

  CreateEnterpriseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    enterprise = json['enterprise'] != null
        ? new Enterprise.fromJson(json['enterprise'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.enterprise != null) {
      data['enterprise'] = this.enterprise.toJson();
    }
    return data;
  }
}

