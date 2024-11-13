 
import 'package:ecommerce_app_mobile/model/product_category/product_category_data_model.dart';

class GetChildrenByIdCategoryResponse {
  bool? success;
  String? message;
  List<ProductCategoryDataModel>? data;

  GetChildrenByIdCategoryResponse(
      {this.success, this.message, this.data});

  GetChildrenByIdCategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductCategoryDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductCategoryDataModel.fromJson(v));
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
