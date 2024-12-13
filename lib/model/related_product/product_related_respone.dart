import 'package:ecommerce_app_mobile/model/related_product/product_related_model.dart';

class ProductRelatedRespone {
  bool? success;
  String? message;
  List<ProductRelatedModel>? data;

  ProductRelatedRespone({this.success, this.message, this.data});

  ProductRelatedRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductRelatedModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductRelatedModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
