class CartItem {
  late final String id;
  late final String productTitle;
  late final int productQuantity;
  late final double productPrice;

  CartItem(
      {
        required this.id,
        required this.productQuantity,
        required this.productTitle,
        required this.productPrice});
}