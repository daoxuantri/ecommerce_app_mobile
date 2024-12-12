import 'package:ecommerce_app_mobile/model/filters/product_filter_data_model.dart';

class FilterProductRespone {
  bool? success;
  List<ProductsFilterDataModel>? products;

  FilterProductRespone({this.success, this.products});

  FilterProductRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['products'] != null) {
      products = <ProductsFilterDataModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductsFilterDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
