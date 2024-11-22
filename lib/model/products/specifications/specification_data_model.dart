import 'package:ecommerce_app_mobile/model/products/specifications/specification_child_model.dart';

class DetailDataModel {
  String? category;
  List<DetailChildModel>? details;

  DetailDataModel({this.category, this.details});

  DetailDataModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['details'] != null) {
      details = <DetailChildModel>[];
      json['details'].forEach((v) {
        details!.add(new DetailChildModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}