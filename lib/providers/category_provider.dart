import 'dart:convert';
import 'package:fewaclothing/models/category.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<FewaCategory> fewaCategoryList = [];

  void fetchCategory() async {
    fewaCategoryList = [];
    var url = '$READ_CATEGORY_URL';
    var response = await http.get(url);
    var result = jsonDecode(response.body);

    result.forEach((c) {
      var fewaCategory = FewaCategory.fromJson(c);
      fewaCategoryList.add(fewaCategory);
    });
    notifyListeners();
  }
}
