class ProductItemModel {
  String? product;
  String? name;
  int? quantity;
  String? images;
  int? price;
  String? color;
  String? sId;
  String? memory;

  ProductItemModel(
      {this.product,
      this.name,
      this.quantity,
      this.images,
      this.price,
      this.color,
      this.sId,
      this.memory});

  ProductItemModel.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    name = json['name'];
    quantity = json['quantity'];
    images = json['images'];
    price = json['price'];
    color = json['color'];
    sId = json['_id'];
    memory = json['memory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['images'] = this.images;
    data['price'] = this.price;
    data['color'] = this.color;
    data['_id'] = this.sId;
    data['memory'] = this.memory;
    return data;
  }
}