import 'package:ecommerce_app_mobile/model/filter_product_category/specification_data_model.dart';

class ProductFilterDataModel {
  String? sId;
  String? name;
  List<String>? images;
  String? category;
  String? brand;
  String? description;
  double? rating;
  int? sold;
  bool? status;
  bool? isStock;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Specifications>? specifications;
  List<String>? memories;
  List<String>? colors;
  int? initPrice;
  int? discPrice;

  ProductFilterDataModel(
      {this.sId,
      this.name,
      this.images,
      this.category,
      this.brand,
      this.description,
      this.rating,
      this.sold,
      this.status,
      this.isStock,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.specifications,
      this.memories,
      this.colors,
      this.initPrice,
      this.discPrice});

  ProductFilterDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    category = json['category'];
    brand = json['brand'];
    description = json['description'];
    rating = (json['rating'] != null) ? (json['rating'] as num).toDouble() : null; 
    sold = json['sold'];
    status = json['status'];
    isStock = json['isStock'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['specifications'] != null) {
      specifications = <Specifications>[];
      json['specifications'].forEach((v) {
        specifications!.add(new Specifications.fromJson(v));
      });
    }
    memories = json['memories'].cast<String>();
    colors = json['colors'].cast<String>();
    initPrice = json['initPrice'];
    discPrice = json['discPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['sold'] = this.sold;
    data['status'] = this.status;
    data['isStock'] = this.isStock;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.specifications != null) {
      data['specifications'] =
          this.specifications!.map((v) => v.toJson()).toList();
    }
    data['memories'] = this.memories;
    data['colors'] = this.colors;
    data['initPrice'] = this.initPrice;
    data['discPrice'] = this.discPrice;
    return data;
  }
}