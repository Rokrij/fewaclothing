import 'package:fewaclothing/models/category.dart';
import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/providers/product_provider.dart';
import 'package:fewaclothing/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductByCategoryPage extends StatefulWidget {
  final FewaCategory category;
  @override
  _ProductByCategoryPageState createState() => _ProductByCategoryPageState();

  ProductByCategoryPage(this.category);
}

class _ProductByCategoryPageState extends State<ProductByCategoryPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: (Icon(
            Icons.arrow_back_ios,
            color: Colors.pink,
            size: 30,
          )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Center(
          child: Text(
            'Fewa Clothing',
            style: GoogleFonts.greatVibes(
              textStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Text('${widget.category.name}s',style: GoogleFonts.alegreyaSansSc(
              textStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),),
          ),
          ProductByCatWidget(widget.category.name),
        ],
      ),
    );
  }
}


class ProductByCatWidget extends StatelessWidget {


  final String category;
  ProductByCatWidget(this.category);

  List<FewaProduct> productList = [];
  @override
  Widget build(BuildContext context) {

    productList = Provider.of<ProductProvider>(context, listen: false).filterProductByCategory(category);
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

