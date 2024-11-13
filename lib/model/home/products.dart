class ProductDataModel {
  String? sId;
  String? name;
  List<String>? images;
  String? category;
  String? brand;
  String? description;
  int? price;
  int? rating;
  int? sold;
  bool? status;
  bool? isStock;

  ProductDataModel(
      {this.sId,
      this.name,
      this.images,
      this.category,
      this.brand,
      this.description,
      this.price,
      this.rating,
      this.sold,
      this.status,
      this.isStock});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    category = json['category'];
    brand = json['brand'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
    sold = json['sold'];
    status = json['status'];
    isStock = json['isStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['sold'] = this.sold;
    data['status'] = this.status;
    data['isStock'] = this.isStock;
    return data;
  }
}