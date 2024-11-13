class BannerDataModel {
  String? sId;
  String? name;
  String? images;
  String? description;

  BannerDataModel(
      {this.sId,
      this.name,
      this.images,
      this.description,});

  BannerDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'];
    description = json['description'];

  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['description'] = this.description;
    return data;
  }
}