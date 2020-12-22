import 'dart:convert';

import 'package:fewaclothing/models/trending_items.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class TrendingProduct extends ChangeNotifier {

  List<TrendingItems> trendingProductList = [];

  void fetchTrendingProduct() async {
    var url = '$READ_TRENDING_URL';
    var response = await http.get(url);
    var result = jsonDecode(response.body);

    result.forEach((c){
      var trendingProduct = TrendingItems.fromJson(c);
      trendingProductList.add(trendingProduct);
    });
    notifyListeners();
  }

}