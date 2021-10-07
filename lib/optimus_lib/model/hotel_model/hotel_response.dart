class HotelsResponse {
  String message;
  List<Hotels> hotels;

  HotelsResponse({this.message, this.hotels});

  HotelsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['hotels'] != null) {
      hotels = <Hotels>[];
      json['hotels'].forEach((v) {
        hotels.add(new Hotels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.hotels != null) {
      data['hotels'] = this.hotels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hotels {
  String designation;

  Hotels({this.designation});

  Hotels.fromJson(Map<String, dynamic> json) {
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['designation'] = this.designation;
    return data;
  }
}
