import 'package:ecommerce_app_mobile/model/orders/information_user_model.dart';
import 'package:ecommerce_app_mobile/model/orders/order_detail_data_model.dart';

class OrderDataModel {
  InfomationUser? infomationUser;
  String? sId;
  String? user;
  List<ProductItemDetailModel>? productItem;
  String? orderStatus;
  int? total;

  OrderDataModel(
      {this.infomationUser,
      this.sId,
      this.user,
      this.productItem,
      this.orderStatus,
      this.total});

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    infomationUser = json['infomationUser'] != null
        ? new InfomationUser.fromJson(json['infomationUser'])
        : null;
    sId = json['_id'];
    user = json['user'];
    if (json['productItem'] != null) {
      productItem = <ProductItemDetailModel>[];
      json['productItem'].forEach((v) {
        productItem!.add(new ProductItemDetailModel.fromJson(v));
      });
    }
    orderStatus = json['orderStatus'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.infomationUser != null) {
      data['infomationUser'] = this.infomationUser!.toJson();
    }
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.productItem != null) {
      data['productItem'] = this.productItem!.map((v) => v.toJson()).toList();
    }
    data['orderStatus'] = this.orderStatus;
    data['total'] = this.total;
    return data;
  }
}