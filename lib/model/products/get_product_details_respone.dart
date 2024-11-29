import 'package:ecommerce_app_mobile/model/products/data_details_product.dart';

class ProductDetailsRespone {
  bool? success;
  String? message;
  DataDetailProduct? data;

  ProductDetailsRespone({this.success, this.message, this.data});

  ProductDetailsRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataDetailProduct.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}