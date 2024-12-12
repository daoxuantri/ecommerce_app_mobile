 
import 'package:ecommerce_app_mobile/model/product_category/detail_product_cate/product_cate_data_model.dart';

class ProductDetailCategoriesRespone {
  bool? success;
  String? message;
  List<ProductCateDataModel>? data;

  ProductDetailCategoriesRespone({this.success, this.message, this.data});

  ProductDetailCategoriesRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductCateDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductCateDataModel.fromJson(v));
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