import 'cart_item.dart';

class Order{
 late final String orderId;
 late final double amount;
 late final List<CartItem> products;
 late final DateTime dateTime;

 Order({
   required this.orderId,
   required this.amount,
   required this.products,
   required this.dateTime});
}