class UserDataModel {
  String? username;
  String? email;
  String? images;
  int? bonuspoint;
  String? id;

  UserDataModel({this.username, this.email, this.images, this.bonuspoint, this.id});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    images = json['images'];
    bonuspoint = json['bonuspoint'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['images'] = this.images;
    data['bonuspoint'] = this.bonuspoint;
    data['id'] = this.id;
    return data;
  }
}