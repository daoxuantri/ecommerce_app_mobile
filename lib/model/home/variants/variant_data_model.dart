import 'package:ecommerce_app_mobile/model/home/variants/variant_child_data_model.dart';

class VariantDataModel {
  String? sId;
  String? product;
  String? memory;
  List<Variants>? variantschild;

  VariantDataModel({this.sId, this.product, this.memory, this.variantschild});

  VariantDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'];
    memory = json['memory'];
    if (json['variants'] != null) {
      variantschild = <Variants>[];
      json['variants'].forEach((v) {
        variantschild!.add(new Variants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['product'] = this.product;
    data['memory'] = this.memory;
    if (this.variantschild != null) {
      data['variants'] = this.variantschild!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}