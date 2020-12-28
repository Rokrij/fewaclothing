import 'dart:convert';

import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TrendingProductProvider extends ChangeNotifier {
  List<FewaProduct> trendingProductList = [];

  void fetchTrendingProduct() async {
    trendingProductList = [];
    var url = '$READ_TRENDING_URL';
    var response = await http.get(url);
    var result = jsonDecode(response.body);

    result.forEach((c) {
      var trendingProduct = FewaProduct.fromJson(c);
      trendingProductList.add(trendingProduct);
    });
    notifyListeners();
  }
}
