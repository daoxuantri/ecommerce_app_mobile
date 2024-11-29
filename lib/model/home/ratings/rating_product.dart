import 'package:ecommerce_app_mobile/model/home/variants/variant_data_model.dart';

class RatingProductDataModel {
  String? sId;
  String? name;
  List<String>? images;
  int? rating;
  int? sold;
  List<VariantDataModel>? variants;

  RatingProductDataModel(
      {this.sId,
      this.name,
      this.images,
      this.rating,
      this.sold,
      this.variants});

  RatingProductDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    rating = json['rating'];
    sold = json['sold'];
    if (json['variants'] != null) {
      variants = <VariantDataModel>[];
      json['variants'].forEach((v) {
        variants!.add(new VariantDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['rating'] = this.rating;
    data['sold'] = this.sold;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
