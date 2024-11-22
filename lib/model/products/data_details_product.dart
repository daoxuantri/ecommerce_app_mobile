import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
import 'package:ecommerce_app_mobile/model/products/specifications/specification_data_model.dart';
import 'package:ecommerce_app_mobile/model/products/variants/variant_data_model.dart';

class DataDetailProduct {
  ProductDataModel? product;
  List<DetailDataModel>? details;
  List<VariantDataModel>? variants;

  DataDetailProduct({this.product, this.details, this.variants});

  DataDetailProduct.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new ProductDataModel.fromJson(json['product']) : null;
    if (json['details'] != null) {
      details = <DetailDataModel>[];
      json['details'].forEach((v) {
        details!.add(new DetailDataModel.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <VariantDataModel>[];
      json['variants'].forEach((v) {
        variants!.add(new VariantDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}