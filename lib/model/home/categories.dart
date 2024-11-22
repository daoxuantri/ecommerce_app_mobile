import 'package:ecommerce_app_mobile/model/home/categories_model.dart/brands.dart';
import 'package:ecommerce_app_mobile/model/home/categories_model.dart/category.dart';
import 'package:ecommerce_app_mobile/model/home/products.dart';

class CategoriesDataModelRespone {
  CategoryDataModel? category;
  List<ProductDataModel>? products;
  List<BrandDataModel>? brands;

  CategoriesDataModelRespone({this.category, this.products, this.brands});

  CategoriesDataModelRespone.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new CategoryDataModel.fromJson(json['category'])
        : null;
    if (json['products'] != null) {
      products = <ProductDataModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductDataModel.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <BrandDataModel>[];
      json['brands'].forEach((v) {
        brands!.add(new BrandDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}