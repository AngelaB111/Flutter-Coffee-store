class CartItem {
  final String title;
  final String image;
  final String size;
  final double unitPrice;
  int quantity;

  CartItem({
    required this.title,
    required this.image,
    required this.size,
    required this.unitPrice,
    this.quantity = 1,
  });

  double get totalPrice => unitPrice * quantity;
}
