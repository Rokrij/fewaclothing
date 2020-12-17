import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/providers/product_provider.dart';
import 'package:fewaclothing/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductListWidget extends StatelessWidget {
  List<FewaProduct> productList = [];
  @override
  Widget build(BuildContext context) {
    productList=Provider.of<ProductProvider>(context,listen:false).fewaProductList;
    // productList = new List.from(productList.reversed);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productList.length,
        crossAxisCount: 4,
        itemBuilder: (context, index) => ProductWidget(productList[index]),
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      ),
    );
  }
}
