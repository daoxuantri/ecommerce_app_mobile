class InfomationUser {
  String? address;
  String? phone;
  String? name;

  InfomationUser({this.address, this.phone, this.name});

  InfomationUser.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    phone = json['phone'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['name'] = this.name;
    return data;
  }
}
