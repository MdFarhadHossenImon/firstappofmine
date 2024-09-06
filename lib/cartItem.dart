class CartItem {
  final String name;
  final int price;
  final String color;
  final String size;
  int quantity;
  final String imagePath;

  CartItem({
    required this.name,
    required this.price,
    required this.color,
    required this.size,
    required this.quantity,
    required this.imagePath,
  });
}
