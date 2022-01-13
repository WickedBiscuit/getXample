import 'dart:core';
import 'package:get/get.dart';
import 'package:getx_example/models/cart_item.dart';

class CartController extends GetxController{
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items{
    return {..._items};
  }

  int get itemCount {
    //return _items?.length?? 0;
    return _items.length;
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.productPrice * cartItem.productQuantity;
    });

    return total;
  }

  void addItem(int productId, double price, String title, int quantity){
    if (_items.containsKey(productId)){
      _items.update(
        productId,
          (existingCartItem) => CartItem(
            id: existingCartItem.id,
            productTitle: existingCartItem.productTitle,
            productPrice: existingCartItem.productPrice,
            productQuantity: existingCartItem.productQuantity + 1

          )
      );
    }else{
      _items.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toString(),
        productQuantity: 1,
        productPrice: price,
        productTitle: title
      ));
    }
    update();
  }

  void removeItem(int productId){
    _items.remove(productId);
    update();
  }

  void clear(){
    _items = {};
    update();
  }
}