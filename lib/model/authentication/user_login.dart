class UserLogin {
  Data? data;
  bool? success;
  int? code;

  UserLogin({this.data, this.success, this.code});

  UserLogin.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? id;
  String? fullName;
  String? role;
  String? vendorId;
  String? jwtToken;

  Data({this.id, this.fullName, this.role, this.vendorId, this.jwtToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    role = json['role'];
    vendorId = json['vendorId'];
    jwtToken = json['jwtToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['role'] = this.role;
    data['vendorId'] = this.vendorId;
    data['jwtToken'] = this.jwtToken;
    return data;
  }
}
