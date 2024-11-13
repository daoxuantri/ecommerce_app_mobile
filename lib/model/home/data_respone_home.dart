import 'package:ecommerce_app_mobile/model/home/banners.dart';
import 'package:ecommerce_app_mobile/model/home/categories.dart';
import 'package:ecommerce_app_mobile/model/home/products.dart';

class Data {
  List<BannerDataModel>? banners;
  List<CategoriesDataModelRespone>? categories;
  List<ProductDataModel>? products;
  List<ProductDataModel>? ratingProducts;

  Data({this.banners, this.categories, this.products, this.ratingProducts});

  Data.fromJson(Map<String, dynamic> json) {
    
    if (json['banners'] != null) {
      banners = <BannerDataModel>[];
      json['banners'].forEach((v) {
        banners!.add(new BannerDataModel.fromJson(v));
      });
      
    }
    
    if (json['categories'] != null) {
      categories = <CategoriesDataModelRespone>[];
      json['categories'].forEach((v) {
        categories!.add(new CategoriesDataModelRespone.fromJson(v));
      });
      print("Đang phân tích banners...");
    }
    if (json['products'] != null) {
      products = <ProductDataModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductDataModel.fromJson(v));
      });
    }

    if (json['rating'] != null) {
      ratingProducts = <ProductDataModel>[];
      json['rating'].forEach((v) {
        ratingProducts!.add(new ProductDataModel.fromJson(v));
      });
    }

    print("JSON từ API: $json");

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.ratingProducts != null) {
      data['rating'] = this.ratingProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}