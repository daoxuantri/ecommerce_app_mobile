import 'package:ecommerce_app_mobile/model/orders/order_data_model.dart';

class GetListOrderResponse {
  bool? success;
  String? message;
  List<OrderDataModel>? order;

  GetListOrderResponse({this.success, this.message, this.order});

  GetListOrderResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['order'] != null) {
      order = <OrderDataModel>[];
      json['order'].forEach((v) {
        order!.add(new OrderDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.order != null) {
      data['order'] = this.order!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}