import 'package:ecommerce_app_mobile/model/product_category/product_category_data_model.dart';

class GetCategoryByIdResponse {
  bool? success;
  String? message;
  ProductCategoryDataModel? data;

  GetCategoryByIdResponse({this.success,this.message, this.data});

  GetCategoryByIdResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new ProductCategoryDataModel.fromJson(json['data']) : null;
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