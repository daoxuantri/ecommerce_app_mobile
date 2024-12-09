class ProductItem {
  final String productId;
  final String name;
  final int quantity;
  final String images;
  final int price;
  final String color;
  final String memory;

  ProductItem({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.images,
    required this.price,
    required this.color,
    required this.memory,
  });
}

class UserInformation {
  final String address;
  final String phone;
  final String name;

  UserInformation({
    required this.address,
    required this.phone,
    required this.name,
  });
}