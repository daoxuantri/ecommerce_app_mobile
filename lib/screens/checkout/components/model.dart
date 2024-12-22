class Order {
  List<ProductItem> productItem;
  InformationUser  informationUser ;
   bool paid;

  Order({
    required this.productItem,
    required this.informationUser ,
    required this.paid ,
  });

  Map<String, dynamic> toJson() {
    return {
      'productItem': productItem.map((item) => item.toJson()).toList(),
      'informationUser ': informationUser .toJson(),
      'paid': paid
    };
  }
}

class ProductItem {
  final String product;
  final String name;
  final int quantity;
  final String images;
  final int price;
  final String color;
  final String? memory;

  ProductItem({
    required this.product,
    required this.name,
    required this.quantity,
    required this.images,
    required this.price,
    required this.color,
     this.memory,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'name': name,
      'quantity': quantity,
      'images': images,
      'price': price,
      'color': color,
      'memory': memory,
    };
  }
}

class InformationUser  {
  final String address;
  final String phone;
  final String name;

  InformationUser ({
    required this.address,
    required this.phone,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'phone': phone,
      'name': name,
    };
  }
}