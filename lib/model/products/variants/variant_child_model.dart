class VariantChildModel {
  String? color;
  int? price;
  String? sId;

  VariantChildModel({this.color, this.price, this.sId});

  VariantChildModel.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['price'] = this.price;
    data['_id'] = this.sId;
    return data;
  }
}