import 'package:fewaclothing/models/product.dart';
import 'package:fewaclothing/providers/product_provider.dart';
import 'package:fewaclothing/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget{

  List<FewaProduct> productList = [];

  @override
  Widget build(BuildContext context) {

    productList = Provider.of<ProductProvider>(context, listen: false).filterProductByFav();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Text(
          'Fewa Clothing',
          style: GoogleFonts.greatVibes(
            textStyle: TextStyle(
                color: Colors.pink, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'cart');
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:
        productList.isEmpty ?
            Center(child: Text('No fav found'),)
        :
        Padding(
          padding: const EdgeInsets.all(16),
          child: StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productList.length,
            crossAxisCount: 4,
            itemBuilder: (context, index) => ProductWidget(productList[index]),
            staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          ),
        ),
      ),
    );
  }
}
