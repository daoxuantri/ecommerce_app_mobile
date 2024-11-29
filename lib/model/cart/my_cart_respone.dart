import 'package:ecommerce_app_mobile/model/cart/my_cart_data_model.dart';

class GetCartByIdRespone {
  bool? success;
  String? message;
  MyCartDataModel? data;

  GetCartByIdRespone({this.success, this.message, this.data});

  GetCartByIdRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new MyCartDataModel.fromJson(json['data']) : null;
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
