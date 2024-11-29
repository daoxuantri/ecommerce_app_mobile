import 'package:ecommerce_app_mobile/model/products/variants/price.dart';

class VariantChildModel {
  Price? price;
  String? color;
  String? sId;

  VariantChildModel({this.price, this.color, this.sId});

  VariantChildModel.fromJson(Map<String, dynamic> json) {
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    color = json['color'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['color'] = this.color;
    data['_id'] = this.sId;
    return data;
  }
}