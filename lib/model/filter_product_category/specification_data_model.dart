class Specifications {
  String? key;
  String? value;
  String? sId;

  Specifications({this.key, this.value, this.sId});

  Specifications.fromJson(Map<String, dynamic> json) {
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