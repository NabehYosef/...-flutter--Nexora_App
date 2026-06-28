class CartItem {
  final String name;
  final double basePrice;
  final int quantity;

  CartItem({
    required this.name,
    required this.basePrice,
    this.quantity = 1,
  });
}