import 'package:ecommerce_app_mobile/model/cart/product_item_model.dart';

class MyCartDataModel {
  String? sId;
  String? user;
  int? total;
  List<ProductItemModel>? productItem; 

  MyCartDataModel(
      {this.sId,
      this.user,
      this.total,
      this.productItem});

  MyCartDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    total = json['total'];
    if (json['productItem'] != null) {
      productItem = <ProductItemModel>[];
      json['productItem'].forEach((v) {
        productItem!.add(new ProductItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['total'] = this.total;
    if (this.productItem != null) {
      data['productItem'] = this.productItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}