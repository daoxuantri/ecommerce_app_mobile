import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';

class getAllProductResponse {
  List<ProductDataModel>? data;
  bool? success;
  String? message;

  getAllProductResponse({this.data, this.success, this.message});

  getAllProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductDataModel.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
