class CartItem {
  final String name;
  final String imagePath;
  final String price;
  int quantity;

  CartItem({
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}
