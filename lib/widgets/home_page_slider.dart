
import 'package:fewaclothing/models/trending_items.dart';
import 'package:fewaclothing/providers/trending_product_provider.dart';
import 'package:fewaclothing/widgets/trending_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageSlider extends StatelessWidget {
  List<TrendingItems> trendingProductList = [];
  @override
  Widget build(BuildContext context) {
    trendingProductList = Provider.of<TrendingProduct>(context, listen: false).trendingProductList;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
            width:175,
            child: TrendingWidget(trendingProductList[index]));
      },
    );
  }
}