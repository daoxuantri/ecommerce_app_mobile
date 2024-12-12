class SpecificationsDataModel {
  String? key;
  String? value;
  String? sId;

  SpecificationsDataModel({this.key, this.value, this.sId});

  SpecificationsDataModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['_id'] = this.sId;
    return data;
  }
}