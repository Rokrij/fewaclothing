import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/providers/product_provider.dart';
import 'package:fewaclothing/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'widgets/product_widget.dart';

class SearchDetails extends StatefulWidget {
  @override
  _SearchDetailsState createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  List<FewaProduct> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.only(left:14),
              child: TextField(
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    productList=Provider.of<ProductProvider>(context, listen: false)
                        .filterProduct(value);
                  });
                },
                decoration: InputDecoration(

                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, 'cart');
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //SearchTabBar(),
            productListWidget(),
          ],
        ),
      ),
    );
  }

  Widget productListWidget() {
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
