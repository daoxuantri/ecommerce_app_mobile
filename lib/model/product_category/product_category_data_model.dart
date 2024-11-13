
class ProductCategoryDataModel {
 String? name;
 String? images;
 String? sId;

  ProductCategoryDataModel({this.name,
      this.images,
      this.sId});

  ProductCategoryDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    images = json['images'];
    sId = json['_id'];
  }

 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['images'] = this.images;
    data['_id'] = this.sId;
    return data;
  }
}
