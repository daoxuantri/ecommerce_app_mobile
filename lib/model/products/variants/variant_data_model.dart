import 'package:ecommerce_app_mobile/model/products/variants/variant_child_model.dart';

class VariantDataModel {
  String? sId;
  String? product;
  String? memory;
  List<VariantChildModel>? variants;

  VariantDataModel(
      {this.sId,
      this.product,
      this.memory,
      this.variants});

  VariantDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'];
    memory = json['memory'];
    if (json['variants'] != null) {
      variants = <VariantChildModel>[];
      json['variants'].forEach((v) {
        variants!.add(new VariantChildModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['product'] = this.product;
    data['memory'] = this.memory;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}