import 'package:ecommerce_app_mobile/model/filter_product_category/product_filter_data_model.dart';

class FilterProductCategoriesRespone {
  bool? success;
  String? message;
  List<ProductFilterDataModel>? data;

  FilterProductCategoriesRespone({this.success, this.message, this.data});

  FilterProductCategoriesRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductFilterDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductFilterDataModel.fromJson(v));
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