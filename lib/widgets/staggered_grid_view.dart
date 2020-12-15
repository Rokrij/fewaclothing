import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/providers/product_provider.dart';
import 'package:fewaclothing/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class StaggeredImage extends StatelessWidget {
  List<FewaProduct> productList = [];
  @override
  Widget build(BuildContext context) {
    productList=Provider.of<ProductProvider>(context,listen:false).fewaProductList;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) => ProductWidget(productList[index]),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
        ),
      ),
    );
  }
}
