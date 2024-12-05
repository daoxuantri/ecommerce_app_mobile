class AddressDataModel {
  String? address;
  bool? status;
  String? phone;
  String? name;
  String? sId;

  AddressDataModel({this.address, this.status, this.phone, this.name, this.sId});

  AddressDataModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    status = json['status'];
    phone = json['phone'];
    name = json['name'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['_id'] = this.sId;
    return data;
  }
}