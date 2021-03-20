import 'dart:convert';

import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider extends ChangeNotifier {
  List<FewaProduct> fewaProductList = [];

  List<String> favList = [];


  void favClick(String id){
    if(favList.contains(id)){
      removeFav(id);
    }else{
      addToFav(id);
    }
  }

  void fetchFavList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList = prefs.getStringList("favList") ?? [];
    favList = favList.toSet().toList();
    print(favList.toString());
    notifyListeners();
  }

  void addToFav(String id) async{
    favList.add(id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favList', favList);
    favList = favList.toSet().toList();
    print(favList.toString());
    notifyListeners();
  }

  void removeFav(String id) async{
    favList.remove(id);
    print(favList.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favList', favList);
    favList = favList.toSet().toList();
    notifyListeners();
  }

  bool isFav(String id){
    print(favList.toString());
    print(id);
    print("Hello");
    for(var fav in favList){
      if(fav == id){
        return true;
      }
    }
    return false;
  }

  List<FewaProduct> filterProductByFav() {
    List<FewaProduct> filteredProduct = [];
    fewaProductList.forEach((product) {
      favList.forEach((element) {
        if (product.id == element) {
          filteredProduct.add(product);
        }
      });
    });
    return filteredProduct;
  }

  void fetchProduct() async {
    fewaProductList = [];
    var url = '$READ_PRODUCT_URL';
    var response = await http.get(url);
    var result = jsonDecode(response.body);

    result.forEach((c) {
      var fewaProduct = FewaProduct.fromJson(c);
      fewaProductList.add(fewaProduct);
    });
    notifyListeners();
  }

  List<FewaProduct> filterProductByCategory(String category) {
    List<FewaProduct> filteredProduct = [];

    fewaProductList.forEach((product) {
      if (product.category == category) {
        filteredProduct.add(product);
      }
    });
    return filteredProduct;
  }
  List<FewaProduct> filterProduct(String query) {
    List<FewaProduct> filteredProduct = [];

    fewaProductList.forEach((product) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        filteredProduct.add(product);
      }
    });
    return filteredProduct;
  }
}
