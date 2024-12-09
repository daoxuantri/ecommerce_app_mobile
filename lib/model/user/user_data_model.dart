class UserDataModel {
  String? username;
  String? email;
  String? images;
  int? bonuspoint;
  String? id;
  int? cartTotalItems;
  int? ordersTotalItems;

  UserDataModel({this.username, this.email, this.images, this.bonuspoint, this.id, this.cartTotalItems,
      this.ordersTotalItems});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    images = json['images'];
    bonuspoint = json['bonuspoint'];
    id = json['id'];
     cartTotalItems = json['cartTotalItems'];
    ordersTotalItems = json['ordersTotalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['images'] = this.images;
    data['bonuspoint'] = this.bonuspoint;
    data['id'] = this.id;
    data['cartTotalItems'] = this.cartTotalItems;
    data['ordersTotalItems'] = this.ordersTotalItems;
    return data;
  }
}