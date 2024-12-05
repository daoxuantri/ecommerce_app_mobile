class SelectedProduct {
  final String id;
  final String name;
  final int price;
  final int quantity;
  final String? color;
  final String? memory;
  final String? images;

  SelectedProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.color,
    this.memory,
    required this.images
  });
}