import 'dart:convert';
import 'package:fewaclothing/models/cart.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  List<FewaCart> fewaCartList = [];

  int totalPrice=0;
  int totalQuantity=0;


  void fetchCart() async {
    fewaCartList = [];
    var url = '$READ_CART_URL';
    var response = await http.get(url);
    var result = jsonDecode(response.body);

    result.forEach((c) {
      var fewaCart = FewaCart.fromJson(c);
      fewaCartList.add(fewaCart);
    });
    notifyListeners();
  }
  void addToCart(FewaCart cart){
     totalQuantity +=int.parse(cart.quantity);
    var price=int.parse(cart.quantity) *int.parse(cart.price);
    totalPrice += price;
    fewaCartList.add(cart);
    notifyListeners();

  }
  void removeFromCart(FewaCart cart){
    fewaCartList.remove(cart);
    totalQuantity -=int.parse(cart.quantity);
    var price=int.parse(cart.quantity) *int.parse(cart.price);
    totalPrice -= price;
    notifyListeners();
  }
}