class ProductItemDetailModel {
  String? product;
  String? name;
  int? quantity;
  String? images;
  int? price;
  String? memory;
  String? color;
  String? sId;

  ProductItemDetailModel(
      {this.product,
      this.name,
      this.quantity,
      this.images,
      this.price,
      this.memory,
      this.color,
      this.sId});

  ProductItemDetailModel.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    name = json['name'];
    quantity = json['quantity'];
    images = json['images'];
    price = json['price'];
    memory = json['memory'];
    color = json['color'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['images'] = this.images;
    data['price'] = this.price;
    data['memory'] = this.memory;
    data['color'] = this.color;
    data['_id'] = this.sId;
    return data;
  }
}
