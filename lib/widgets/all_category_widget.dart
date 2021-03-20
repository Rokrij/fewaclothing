import 'package:fewaclothing/models/category.dart';
import 'package:fewaclothing/providers/category_provider.dart';
import 'package:fewaclothing/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllCategoryWidget extends StatelessWidget {

  List<FewaCategory> categoryList = [];

  @override
  Widget build(BuildContext context) {
    categoryList = Provider.of<CategoryProvider>(context, listen: false).fewaCategoryList;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryList.length,
        crossAxisCount: 4,
        itemBuilder: (context, index) => CategoryWidget(categoryList[index]),
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      ),
    );
  }
}
