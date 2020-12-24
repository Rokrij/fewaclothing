import 'dart:convert';

import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
class ProductProvider extends ChangeNotifier {

  List<FewaProduct> fewaProductList = [];

  void fetchProduct() async {
    fewaProductList = [];
    var url = '$READ_PRODUCT_URL';
    var response = await http.get(url);
    var result = jsonDecode(response.body);

    result.forEach((c){
      var fewaProduct = FewaProduct.fromJson(c);
      fewaProductList.add(fewaProduct);
    });
    notifyListeners();
  }

  List<FewaProduct> filterProductByCategory(String category){

    List<FewaProduct> filteredProduct = [];

    fewaProductList.forEach((product) {
      if(product.category == category){
        filteredProduct.add(product);
      }
    });
    return filteredProduct;

  }

}