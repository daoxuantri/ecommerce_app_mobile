import 'package:ecommerce_app_mobile/model/home/banners/banners.dart';
import 'package:ecommerce_app_mobile/model/home/categories/categories.dart';
import 'package:ecommerce_app_mobile/model/home/ratings/rating_product.dart';

class Data {
  List<BannerDataModel>? banners;
  List<CategoriesDataModelRespone>? categories;
  List<RatingProductDataModel>? ratingProducts;

  Data({this.banners, this.categories, this.ratingProducts});

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
    }

    if (json['rating'] != null) {
      ratingProducts = <RatingProductDataModel>[];
      json['rating'].forEach((v) {
        ratingProducts!.add(new RatingProductDataModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.ratingProducts != null) {
      data['rating'] = this.ratingProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}