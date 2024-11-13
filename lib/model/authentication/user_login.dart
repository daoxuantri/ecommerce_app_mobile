class UserLogin {
  bool? success;
  Data? data;

  UserLogin({this.success, this.data});

  UserLogin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? email;
  // String? role;
  String? id;
  String? accessToken;

  Data({this.username, this.email,this.id, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    // role = json['role'];
    id = json['id'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    // data['role'] = this.role;
    data['id'] = this.id;
    data['access_token'] = this.accessToken;
    return data;
  }
}
