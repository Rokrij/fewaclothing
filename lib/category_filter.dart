import 'package:fewaclothing/models/category.dart';
import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/providers/product_provider.dart';
import 'package:fewaclothing/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CategoryFilter extends StatefulWidget {
  final FewaCategory category;
  @override
  _CategoryFilterState createState() => _CategoryFilterState();

  CategoryFilter(this.category);
}

class _CategoryFilterState extends State<CategoryFilter> {

  List<FewaProduct> productList = [];

  @override
  Widget build(BuildContext context) {
    productList = Provider.of<ProductProvider>(context, listen: false).filterProductByCategory(widget.category.name);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        crossAxisCount: 4,
        itemBuilder: (context, index) => ProductWidget(productList[index]),
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      ),
    );
  }
}
