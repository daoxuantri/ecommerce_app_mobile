class BrandDataModel {
  String? sId;
  String? name;
  String? images;

  BrandDataModel(
      {this.sId,
      this.name,
      this.images,});

  BrandDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    return data;
  }
}